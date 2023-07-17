function [etaH]  = ComputeCorrespondingEta(UR,HR,etaHR,etaUR)

edgesUR=edge(UR,'canny',0.01); edgesUR(1:10,:)=0; edgesUR(:,1:10)=0; edgesUR(:,160:end)=0;  edgesUR(160:end,:)=0;
edgesHR=edge(HR,'canny',0.01); edgesHR(1:10,:)=0; edgesHR(:,1:10)=0; edgesHR(:,160:end)=0;  edgesHR(160:end,:)=0;
[gxH,gyH]=imgradient(HR);
[gxU,gyU]=imgradient(UR);
gH=mat2gray(sqrt(gxH.^2+gyH.^2));
gU=mat2gray(sqrt(gxU.^2+gyU.^2));
etaH=zeros(size(etaHR)); gCH=zeros(size(etaHR));
patchsize=7; halfpatch=floor(patchsize/2);
for i=halfpatch+1:1:size(edgesUR,1)-halfpatch
    for j=halfpatch+1:1:size(edgesUR,2)-halfpatch
        EdgeFlag=0;
%         if edgesUR(i,j)==1
        if etaUR(i,j)~=0
            patchH= gH(i-halfpatch:i+halfpatch,j-halfpatch:j+halfpatch);
            for ii=-halfpatch:halfpatch
                for jj=-halfpatch:halfpatch
%                     if (edgesHR(i+ii,j+jj)==1)
                    if (etaHR(i+ii,j+jj)~=0)
                        EdgeFlag=1;
                        distance(ii+halfpatch+1,jj+halfpatch+1)=(((ii)^2)+(jj^2)) + 2*((gU(i,j)-patchH(ii+halfpatch+1,jj+halfpatch+1))^2);
                    else
                        distance(ii+halfpatch+1,jj+halfpatch+1)=inf;
                        trouble=1;
                    end
                end
            end
            if EdgeFlag==1
                [indx,indy]=find(distance==min(distance(:)));
                EdgeFlag=0;
%                 if etaHR(i+indx-halfpatch-1,j+indy-halfpatch-1)~=0
                    gCH(i,j)=gH(i+indx(1)-halfpatch-1,j+indy(1)-halfpatch-1);
                    etaH(i,j)=etaHR(i+indx(1)-halfpatch-1,j+indy(1)-halfpatch-1);
%                 end
%             else
%                 aa=1;
            end
        end
    end
end

end