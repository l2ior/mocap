function shotind = getShotInd( viddir, vidname )
% shotind = getShotInd( viddir, vidname )

% retrieve shot list
[x,name,xx] = fileparts(vidname);
shotdir  = fullfile(viddir,'shots',name,'shots');
shotlist = dir(fullfile(shotdir,'*_in.jpg'));
shotlist = {shotlist(:).name};

% read shot indices
nShot = numel(shotlist);
shotind = zeros(nShot,1);
for iShot = 1:nShot
   shotind(iShot) = str2double(shotlist{iShot}(end-12:end-7));
end

% append the last shot
try
    vidobj = VideoReader(fullfile(viddir,vidname));
catch
    fullfile(viddir,vidname)
    keyboard
end
nFrm = vidobj.NumberOfFrames;
if shotind(end) ~= nFrm
    shotind = [shotind; nFrm+1];
end

% remove too short shots
sd = diff(shotind);
shotind(sd<=10) = [];

% split too long shots
cutind = diff(shotind);
maxFrm = 150;
if sum(cutind>=maxFrm) % max 10 secs
	inds = find(cutind>=maxFrm);
	for ii = 1:numel(inds)
		ind = inds(ii);
		addShot = (shotind(ind)+maxFrm : maxFrm : shotind(ind+1))';
		shotind = [shotind; addShot];
	end
end
shotind = sort(shotind);
