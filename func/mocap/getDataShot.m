function [s1,s2,info1,info2] = getDataShot(type, vID1, vID2)
% Load shots into s1 and s2
% Load labels into lab1 and lab2 if they exist

switch type
    case 'mocap'
        vid1  = sprintf('86_%02d.mat', vID1);
        vid2  = sprintf('86_%02d.mat', vID2);
        
        [X1, info1] = loadMocap(vid1);
        [X2, info2] = loadMocap(vid2);
        
        [S1, S2] = initSoft(X1,X2,20);
       
        s1 = getShots(S1, info1);
        s2 = getShots(S2, info2);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function s = getShots(X, seqInfo)

s = zeros(size(X,1), seqInfo.nSeg);
nFrm = size(X,2);
for iSeg = 1:seqInfo.nSeg
    segStr = seqInfo.segs(iSeg);
    segEnd = min(seqInfo.segs(iSeg+1), nFrm);
    h = mean(X(:,segEnd)-X(:,segStr), 2);
    
    s(:,iSeg) = h / norm(h); % normalize histogram
end