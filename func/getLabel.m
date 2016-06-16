function labels = getLabel(catname)
% get the labels for the download youtubes 
% catname can be numbers in [1,10] or strings (folder names)


addpath(genpath('D:/dropbox/vcFunc'));
if isnumeric(catname)
	catname = getCatname(catname);
end

labeldir = '_labels';
labelers = dir(labeldir);
labelers(1:2) = [];
labelers = {labelers(:).name};

gt = cell(numel(labelers),1);
for iL = 1:numel(labelers)
	matdir = fullfile(labeldir, labelers{iL}, catname, 'labels');
	if ~exist(matdir,'dir')
		fprintf('Dir "%s" does not exist\n', matdir);
		return;
	end

	matlist = getFilelist(matdir,'.mat');
	gt{iL} = cell(numel(matlist),1);
	for iMat = 1:numel(matlist)
		matfile = fullfile(matdir, matlist{iMat});
		gt{iL}{iMat}  = importdata(matfile);
	end
end

labels = cell(numel(matlist),1);
for iMat = 1:numel(matlist)
	ll = []; % count for labels
	for iL = 1:numel(labelers)
		try
			ll = [ll; gt{iL}{iMat}(:,1)];
		catch ME
			keyboard
		end
	end
	[lbl, cnt] = histocount(ll);
	labels{iMat} = lbl(cnt>=1);
end

end



function str = getCatname( catID )
	switch catID
		case 1,  str = '1_surf';
		case 2,  str = '2_state_of_liberty';
		case 3,  str = '3_base_jump';
		case 4,  str = 'bike_polo';
		case 5,  str = 'eiffel_tower';
		case 6,  str = 'excavators_river_corss';
		case 7,  str = 'kids_play_in_leaves';
		case 8,  str = 'mlb';
		case 9,  str = 'nfl';
		case 10, str = 'notre_dame_cathedral';
	end
end