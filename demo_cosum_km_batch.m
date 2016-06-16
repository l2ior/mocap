% Demo clust-based methods using mocap data
clear all; close all; addpaths;

cnt = 0;
pps = []; % people pair list
for vID1 = 1:13
	for vID2 = vID1+1:14
		pps = [pps; [vID1, vID2]];

		% load data
		[s1,s2,info1,info2] = getDataShot('mocap',vID1,vID2);
		label1 = name2label(info1.cnames(info1.label));
		label2 = name2label(info2.cnames(info2.label));
		
		X  = [s1,s2];
		len1 = size(s1,2);
		len2 = size(s2,2);
		
		% kmeans
		k = numel(unique(name2label([info1.cnames, info2.cnames])));
		fprintf('Performing %d-means...\n',k);
		[C,minc] = fastkmeans(X', k);
		kmID    = getDistCen(X,C);
		kmNames = getMocLabel(kmID(:,2),info1,info2);

		clustID1 = minc(1:len1);
		clustID2 = minc(len1+1:end);
		
		% compute metrics
		cnt = cnt+1;

		% compute precision recall
		[p{cnt},r(cnt,1)]  = getPreRec(label1, label2, clustID1, clustID2);
		ap(cnt,1) = mean(p{cnt});
		f1(cnt,1) = 2*ap(cnt)*r(cnt) / (ap(cnt)+r(cnt));
	end
end

%% compute individual p,r,f1
indap = zeros(14,1);
indr  = zeros(14,1);
indf1 = zeros(14,1);
for i = 1:14
	ind = pps(:,1)==i | pps(:,2)==i;
	indr(i)  = mean(r(ind));
	indap(i) = mean(ap(ind));
	ff = f1(ind);
	indf1(i) = mean(ff(~isnan(ff)));
end

%% compute overall p,r,f1
validPair = ~isnan(f1);
allf1 = f1(validPair);
allr  = r(validPair);
allap = ap(validPair);
fprintf('mean(ap)=%.3f, mean(r)=%.3f, mean(f1)=%.3f (%d invalid pairs)\n',...
	mean(allap),mean(allr),mean(allf1),sum(~validPair));
fprintf('std(ap)=%.3f, std(r)=%.3f, std(f1)=%.3f\n',std(allap),std(allr),std(allf1));


%% save to file
savename = ['result_km_',date,'.mat'];
save(savename,'ap','p','r','f1','pps','indr','indap','indf1');
fprintf('Result saved to %s\n', savename);
