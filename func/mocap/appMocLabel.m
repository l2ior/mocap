function IDs = appMocLabel(IDs,info1,info2)
% append labels to current IDs

for i = 1:size(IDs,1)
    ID = IDs{i,2};
    if ID <= info1.nSeg
        label = info1.label(ID);
    else
        label = info2.label(ID-info1.nSeg);
    end
    IDs{i,3} = info1.cnames{label};
end