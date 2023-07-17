function [cls_idx]  = SelectSimilarPatches(X, vec,number)
f2          =   size(X,1);
set         =   1:size(X, 2);
L           =   size(set,2);

for j = 1 : L
    dis   =   (vec(1, :) -  X(1, set(j))).^2;
    for i = 2 : f2
        dis  =  dis + (vec(i, :)-X(i, set(j))).^2;
    end
    [val ind]         =   sort( dis );
    cls_idx(:,set(j))   =   ind(1:number);
end
% cls_idx = cls_idx';
