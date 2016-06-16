function [precision, recall] = getPreRec(label1, label2, clustID1, clustID2)

n1 = numel(label1);
n2 = numel(label2);

cc = unique([clustID1; clustID2]);
cc(cc==0) = [];
nC = numel(cc);

%% compute precision
precision = zeros(nC,1);
for iC = 1:nC
	cID = cc(iC); % cluster ID
	l1 = label1(clustID1==cID);
	l2 = label2(clustID2==cID);
	if cID == 0 || isempty(l1) || isempty(l2)
		continue;
	end
	
	dist = pdist2(l1,l2);
	nMatch = sum(dist(:)==0);
	precision(iC) = nMatch / (numel(l1)*numel(l2));
end

%% compute recall
matchMat = zeros(n1,n2); % get matching matrix
for i1 = 1:n1
	for i2 = 1:n2
		if clustID1(i1)~=0 && clustID2(i2)~=0
			matchMat(i1,i2) = clustID1(i1)==clustID2(i2);
		end
	end
end

gtMat = zeros(n1,n2); % get gt matrix
for i1 = 1:n1
	for i2 = 1:n2
		gtMat(i1,i2) = label1(i1)==label2(i2);
	end
end

nMatch = sum(sum(matchMat & gtMat));
nGT    = sum(gtMat(:));
recall = nMatch / nGT;
