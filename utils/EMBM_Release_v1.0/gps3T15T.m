img3=255.*(img3-min(img3(:)))/(max(img3(:))-min(img3(:)));
img15=255.*(img15-min(img15(:)))/(max(img15(:))-min(img15(:)));
[l3,w3]=edge_width(img3);
[l15,w15]=edge_width(img15);
gps3=l3./w3;
gps15=l15./w15;
gps3(isnan(gps3))=0;
gps15(isnan(gps15))=0;

tr15=zeros(size(gps15)); tr15(find(gps15~=0))=1;
figure
a1=subplot(121); imshow(gps3.*tr15,[]);
a2=subplot(122); imshow(gps15,[]);
linkaxes([a1,a2])