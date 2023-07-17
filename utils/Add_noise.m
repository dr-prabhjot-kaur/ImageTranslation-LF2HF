function im_o   =  Add_noise( im, v, type)

seed  =  0;
randn( 'state', seed );
a = 0;
[M,N,s] = size(im);
R = noise_pdf(type,M,N,s,a,v);
im_o =  double(im) + R;


