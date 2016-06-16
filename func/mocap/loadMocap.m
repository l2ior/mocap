function [X, info] = loadMocap(vID, mocdir)
% Load features and info from data
%
% Ex: [X, info] = loadMocap(1,'./data');


if ~exist('mocdir','var')
    mocdir = './data';
end

if isnumeric(vID)
    vID = sprintf('86_%02d.mat', vID);
end

fprintf('Loading mocap data: %s\n',vID);
try
    info = load(fullfile(mocdir,vID));
catch 
    fprintf('%s may not exist\n', fullfile(mocdir,vID));
end

X    = info.X;
info = rmfield(info, 'X');
