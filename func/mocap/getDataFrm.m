function [s1,s2,info1,info2] = getDataFrm(type)
% Load frames into s1 and s2
% Load labels into lab1 and lab2 if they exist

switch type
    case 'mocap'
        vid1  = '86_03.mat';
        vid2  = '86_05.mat';

        [X1,X2,info1,info2] = loadMocap(vid1,vid2);

        [s1, s2] = initSoftFrm(X1,X2,20);
end
