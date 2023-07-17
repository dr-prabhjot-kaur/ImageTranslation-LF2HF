function [out]=DownSample_1D_2(scale,imvol)
    n=1;
    for i=1:1:size(imvol,2)
        HR(:,:,i)=imvol(:,i,:);
    end;
    for i=1:scale:size(HR,3)
        img3(:,:,n)=mean(HR(:,:,i:i+scale-1),3);
        n=n+1;
    end;
    for i=1:size(img3,2)
        out(:,:,i)=img3(:,i,:);
    end
end
