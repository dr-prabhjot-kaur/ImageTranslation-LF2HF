function img= p2im(p)
    for i=1:1:size(p,2)
        img(:,:,i)=reshape(p(:,i),[sqrt(size(p,1)), sqrt(size(p,1))]);
    end;
end