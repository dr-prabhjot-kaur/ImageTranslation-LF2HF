function [nclusters,cidx,c]  = RefineClusters(maxsize,nclusters,cidx,c)
flag=0; count=1;
for j=1:100
    if flag==1 || j==1
        for i=1:nclusters
            if length(find(cidx==i))>maxsize
                ids=find(cidx==i);
                nclusters=nclusters+1;
                cidx(ids(floor(length(ids)/2):end))=(nclusters);
                c(nclusters,:)=c(i,:);
                whichClustersAreSame(count)=i;
                count=count+1;
                flag=1;
            end
        end
    else
        if j==nclusters || flag==0
            break;
        end
    end
end
