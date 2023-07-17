function [s,RMSE]=csnr3Up(A,B,row,col,thresh)

[n,m,ch]=size(A);
if ch==1
   e=A-B;
   e=e(row+1:n-row,col+1:m-col);
   mse=mean(mean(e.^2));
   RMSE = sqrt(mse);
   s=10*log10(255^2/mse);
else
        ind=find(A<=thresh);
        A=A(row+1:n-row,col+1:m-col,:);
        B=B(row+1:n-row,col+1:m-col,:);
        A(ind)=0;
        B(ind)=0;
        ind=find(A~=0);
        e=A(ind)-B(ind);
        
%    e=e(row+1:n-row,col+1:m-col,:);
%    e1=e(:,:,1);e2=e(:,:,2);e3=e(:,:,3);
%    me1=mean(mean(e1.^2));
%    me2=mean(mean(e2.^2));
%    me3=mean(mean(e3.^2));
%    mse=(me1+me2+me3)/3;
    mse =mean(e(:).^2);
       RMSE = sqrt(mse);

   s  = 10*log10(255^2/mse);
%    s(1)=10*log10(255^2/me1);
%    s(2)=10*log10(255^2/me2);
%    s(3)=10*log10(255^2/me3);
end


return;