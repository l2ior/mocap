% compute temporal feature
function feat = getTempFeat(X)
  Xobs = normalizeCol( X' )';
  Xint = getIntFeat( X );
  feat = [Xobs; Xint];
end