function [x,y]  =       ReaDataNormalized(slicenumber)

    path3T          =       '/home/gpu/Data/Prabhjot/LowLowerLowest/FinalRegistrationWrtMNItemplate1mm3/Subject1/3T';
    path15T         =       '/home/gpu/Data/Prabhjot/LowLowerLowest/FinalRegistrationWrtMNItemplate1mm3/Subject1/1.5T';
    pathmask        =       '/home/gpu/Data/Prabhjot/LowLowerLowest/FinalRegistrationWrtMNItemplate1mm3/Subject1/3T/GeneratingFLIRTFNIRTedMASK_MNI1mm3';

    xvol            =       load_nii(strcat(path3T,'/FNIRT_FLIRT_MNI1mm3_T1w_acpc_dc_restore_brain.nii.gz'));
    xvol.img        =       mat2gray(permute(xvol.img,[2,3,1]));
    x               =       xvol.img(:,:,slicenumber);
    x               =       (flip(flip(x',1),2));

    yvol            =       load_nii(strcat(path15T,'/FNIRT_FLIRT_Subject1_MNI1mm3_T1w_acpc_dc_restore_brain.nii.gz'));
    yvol.img        =       mat2gray(permute(yvol.img,[2,3,1]));
    y               =       yvol.img(:,:,slicenumber);
    y               =       (flip(flip(y',1),2));

    
    mask            =       load_nii(strcat(pathmask,'/FNIRT_FLIRT_mask.nii.gz'));
    mask.img        =       mat2gray(permute(mask.img,[2,3,1]));
    m               =       mask.img(:,:,slicenumber);
    m               =       (flip(flip(m',1),2));

    y               =       m.*y;
    x               =       m.*x;
    
end

