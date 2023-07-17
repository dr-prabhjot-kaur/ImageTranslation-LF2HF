function [bim]=conv_cvx(img,h)
    patchsize=size(h,1); 
    for i=ceil(patchsize/2):1:173-ceil(patchsize/2)
        for j=ceil(patchsize/2):1:173-ceil(patchsize/2)
            a=zeros(173,173);b=zeros(173,173);
            a(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2))=1;
            croped_img=(a.*img)./255;
            b(i-floor(patchsize/2):i+floor(patchsize/2),j-floor(patchsize/2):j+floor(patchsize/2))=h;
            bim(i,j)=sum(b(:).*croped_img(:));
        end
    end
end
