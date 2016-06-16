function label = name2label(segnames, mocdir)

if nargin < 2
    mocdir = './data/';
end

load(fullfile(mocdir, 'mocap_cnames_mapping.mat')); % load label_names

nSeg  = numel(segnames);
label = zeros(nSeg,1);
for i = 1:nSeg
	ind = find(strcmp(label_names(:,1), segnames{i}));
	if ~isempty(ind)
		label(i) = label_names{ind,3};
	else
		fprintf('cannot find label %s\n', segnames{i});
		keyboard
	end
end
