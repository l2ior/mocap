function names = getMocLabel(IDs,info1,info2)
% append labels to current IDs

names = cell(size(IDs,1),1);
for i = 1:size(IDs,1)
    ID = IDs(i);
    if ID <= info1.nSeg
        label = info1.label(ID);
        names{i} = info1.cnames{label};
    else
        label = info2.label(ID-info1.nSeg);
        names{i} = info2.cnames{label};
    end
end