function [im]=Patch2Image(patches,im)
n=1; patchsize=sqrt(size(patches,1)); im=(zeros(size(im)));count=zeros(size(im));
    for i=ceil(patchsize/2):1:size(im,1)-ceil(patchsize/2)
        for j=ceil(patchsize/2):1:size(im,2)-ceil(patchsize/2)
                im(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2))=im(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2))+p2im(patches(:,n));
                count(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2))=count(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2))+1;
                n=n+1;
        end;
    end;
    im=im./count;
end