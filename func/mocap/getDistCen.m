function minID = getDistCen(X,centers)
% minID: first column is min distance
%        second column is the idx

if size(X,1)~=size(centers,1) && size(X,1)==size(centers,2)
    X = X';
elseif size(X,2)~=size(centers,2) && size(X,2)==size(centers,1)
    centers = centers';
end

k  = size(centers,1);

dd = pdist2(X,centers); % X and centers should be row major

% get the minimal distance
[Y,ind] = min(dd,[],2);
minID = zeros(k,2);
for i = 1:k
   ids = find(ind==i);
   if ~isempty(ids)
     [yi,ii] = min(Y(ids));
     minID(i,:) = [yi,ids(ii)];
   end
end
minID = sortrows(minID,1);

minID(minID(:,2)==0,:) = [];

