function [img3]=DownSample_1D_3(scale,imvol)
    n=1;
    for i=1:scale:size(imvol,3)
        img3(:,:,n)=mean(imvol(:,:,i:i+scale-1),3);
        n=n+1;
    end;
end
