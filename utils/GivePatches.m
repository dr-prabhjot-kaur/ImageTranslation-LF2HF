function [patches]=GivePatches(im,patchsize)
n=1;
    for i=ceil(patchsize/2):1:size(im,1)-ceil(patchsize/2)
        for j=ceil(patchsize/2):1:size(im,2)-ceil(patchsize/2)
                p=im(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2));
                patches(:,n)=p(:);
                n=n+1;
        end
    end
end
