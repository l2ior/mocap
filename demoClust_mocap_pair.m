% Demo cluster-based methods using mocap data
clear all; close all; addpaths;

% load data
[s1,s2,info1,info2] = getDataShot('mocap',3,5);
X  = [s1,s2];
len1 = size(s1,2);
len2 = size(s2,2);

%% kmeans
k = 6;
fprintf('Performing %d-means...\n',k);
[C,minc] = fastkmeans(X', k);
kmID    = getDistCen(X,C)
kmNames = getMocLabel(kmID(:,2),info1,info2)

clustID1 = minc(1:len1);
clustID2 = minc(len1+1:end);

label1 = name2label(info1.cnames(info1.label));
label2 = name2label(info2.cnames(info2.label));

%% compute precision
[p,r] = getPreRec(label1, label2, clustID1, clustID2);
ap = mean(p);
fprintf('AP=%.2f, R=%.2f, F1=%.2f\n', ap, r, 2*ap*r/(ap+r));
