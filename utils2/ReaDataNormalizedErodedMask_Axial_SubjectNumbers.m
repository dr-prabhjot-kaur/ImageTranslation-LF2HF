function [x,y]  =       ReaDataNormalizedErodedMask_Axial_SubjectNumbers(slicenumber,erosion,subjectid)

    path3T          =       strcat('../May2020Registertion/30000',num2str(subjectid));
    path15T         =       strcat('../May2020Registertion/20000',num2str(subjectid));
%     pathmask        =       '/home/gpu/Data/Prabhjot/LowLowerLowest/May2020Registertion/300001/';

    xvol            =       load_nii(strcat(path3T,'/T1w_30001_FNIRT_FLIRT_FNIRT_FLIRT_MNI152_T1_1mm_brain.nii.gz'));
    xvol.img        =       mat2gray(permute(xvol.img,[2,1,3]));
    x               =       xvol.img(:,:,slicenumber);
    x               =       ((flip(x,1)));

    yvol            =       load_nii(strcat(path15T,'/T1w_30001_FNIRT_FLIRT_FNIRT_FLIRT_MNI152_T1_1mm_brain.nii.gz'));
    yvol.img        =       mat2gray(permute(yvol.img,[2,1,3]));
    y               =       yvol.img(:,:,slicenumber);
    y               =       ((flip(y,1)));
ix=xvol;iy=yvol;
% if subjectid~=1
%     
%     path3T          =       strcat('/home/gpu/Data/Prabhjot/LowLowerLowest/May2020Registertion/30000',num2str(1));
%     path15T         =       strcat('/home/gpu/Data/Prabhjot/LowLowerLowest/May2020Registertion/20000',num2str(1));
% %     pathmask        =       '/home/gpu/Data/Prabhjot/LowLowerLowest/May2020Registertion/300001/';
% 
%     xvol            =       load_nii(strcat(path3T,'/T1w_30001_FNIRT_FLIRT_FNIRT_FLIRT_MNI152_T1_1mm_brain.nii.gz'));
%     xvol.img        =       mat2gray(permute(xvol.img,[2,1,3]));
%     yvol            =       load_nii(strcat(path15T,'/T1w_30001_FNIRT_FLIRT_FNIRT_FLIRT_MNI152_T1_1mm_brain.nii.gz'));
%     yvol.img        =       mat2gray(permute(yvol.img,[2,1,3]));
%     fy=(imhistmatchn(iy.img,yvol.img));    fx=(imhistmatchn(ix.img,xvol.img));
%     y               =       fy(:,:,slicenumber);
%     y               =       ((flip(y,1)));
%     x               =       fx(:,:,slicenumber);
%     x               =       ((flip(x,1)));
% end
    
%     mask            =       load_nii(strcat(pathmask,'/T1w_30001_FNIRT_FLIRT_FNIRT_FLIRT_MNI152_T1_1mm_brain__seg.nii.gz'));
%     mask.img        =       mat2gray(permute(mask.img,[2,1,3]));
    mask.img=zeros(size(xvol.img)); mask.img(find(xvol.img~=0 & yvol.img~=0))=1;
    m               =       mask.img(:,:,slicenumber);
%     m=ones(size(x)); m(find(x<0.01))    =0;
    m               =       ((flip(m,1)));
    m1=ones(size(m)); m1(find(m==0))    =0; m=m1;
    y               =       m.*y;
    x               =       m.*x;
    
    if erosion==1
        se = strel('sphere',7);        
        y=imerode(m,se).*y;
        x=imerode(m,se).*x;
    else
        y               =       m.*y;
        x               =       m.*x;
    end

end

