clear all; close all;
mx=3970.88623046875000000000000000000000000000;
mn=-561.92950439453125000000000000000000000000; fac=1;
for i=0:10
%     g=load_nii(strcat(num2str(i),'_ground_images_1_SimpleAE_1000_Complete_F.nii'));
%     gr2=zeros(207,176,176-15);
%     gr2(8:207,1:176-7,1:176-7)=double(g.img(1:207-7,8:176,8:end,1));
%     gr21=gr2(15:207,1:176-7,1:176-15);
%     toopG=gr21(:,:,:,1);
%     toopG=fac.*((toopG(:,:,:,1)-mn)./(mx-mn));
% %     imshow3D(gr21);
% %     g.img=gr21;
% %     save_nii(g,strcat(num2str(i),'_ground.nii.gz'));
    to=load_nii(strcat(num2str(i),'_ToPredict_images_1_SimpleAE_1000_Complete_F.nii'));
    to_mask=load_nii(strcat(num2str(i),'_ToPredict_images_1_SimpleAE_1000_Complete_F_brain_mask.nii.gz'));
    se = strel('ball',10,0);
    to_mask.img=imdilate(double(to_mask.img),se);
    to.img=double(to.img).*double(to_mask.img);
    too=zeros(207,176,176-15);
    too(8:207,1:176-7,1:176-7)=double(to.img(1:207-7,8:176,8:end,1));
    toop=too(15:207,1:176-7,1:176-15);
    toop=fac.*((toop(:,:,:,1)-mn)./(mx-mn));
    tooM=zeros(207,176,176-15);
    tooM(8:207,1:176-7,1:176-7)=double(to_mask.img(1:207-7,8:176,8:end,1));
    toopM=tooM(15:207,1:176-7,1:176-15);
    toop=toop.*toopM;
    

%     rec=load_nii(strcat(num2str(i),'_1_SimpleAE_1000_Complete_F.nii'));
%     rec=load_nii(strcat(num2str(i),'_1_ICIP.nii'));
    rec=load_nii(strcat(num2str(i),'_ICIP_3Channel.nii'));
    rec_mask=load_nii(strcat(num2str(i),'_ICIP_3Channel_brain_mask.nii.gz'));
    r1=zeros(207,176,176-15);    rec_mask.img=imdilate(double(rec_mask.img),se);
%     rec.img=double(rec.img(:,:,:,1)).*double(rec_mask.img);
    r1(8:207,1:176-7,1:176-7)=double(rec.img(1:207-7,8:176,8:end,1));
    r11=r1(15:207,1:176-7,1:176-15);
    r11=fac.*((r11(:,:,:,1)-mn)./(mx-mn));
    r1M(8:207,1:176-7,1:176-7)=double(rec_mask.img(1:207-7,8:176,8:end,1));
    r11M=r1M(15:207,1:176-7,1:176-15);
    r11=r11.*r11M;
%     spa=load(strcat(num2str(i),'RE_Rimages.mat'));
    spa=load(strcat(num2str(i),'RE2_Rimages.mat'));
    spa_mask=load_nii(strcat(num2str(i),'_RE2Rimages_brain_mask.nii.gz'));
    spa_mask.img=imdilate(double(spa_mask.img),se);
     for ii=1:size(spa.Rimages,2)
        temp=reshape(spa.Rimages(:,ii,:),size(spa.Rimages,1),size(spa.Rimages,3));
        spas(:,:,ii)=temp';
    end
    spas=double(spas).*double(spa_mask.img);
    spa2=zeros(207,176,176-15);
    spa2(8:size(spas,1)+8-1,1:176-7,1:176-7)=double(spas(:,8:176,8:end,1));
    spa21=spa2(15:207,1:176-7,1:176-15);
    spa2M=zeros(207,176,176-15);
    spa2M(8:size(spa_mask.img,1)+8-1,1:176-7,1:176-7)=double(spa_mask.img(:,8:176,8:end,1));
    spa21M=spa2M(15:207,1:176-7,1:176-15);

    paper16s=load_nii(strcat(num2str(i),'Comp.nii'));
    paper16s_mask=load_nii(strcat(num2str(i),'Comp_brain_mask.nii.gz'));
    paper16s_mask.img=imdilate(double(paper16s_mask.img),se);
    paper16s.img=double(paper16s.img).*double(paper16s_mask.img);
    paper16=paper16s.img(15:207,1:176-7,1:176-15);
    paper16M=paper16s_mask.img(15:207,1:176-7,1:176-15);
    si=load_nii(strcat(num2str(i),'_1_SimpleAE_single_channel.nii'));
    sis=load_nii(strcat(num2str(i),'_1_SimpleAE_single_channel_brain_mask.nii.gz'));
    sis.img=imdilate(double(sis.img),se);
    si.img=double(si.img).*double(sis.img);
    si2=zeros(207,176,176-15);
    si2(8:207,1:176-7,1:176-7)=double(si.img(1:207-7,8:176,8:end,1));
    si21=si2(15:207,1:176-7,1:176-15);
    siji=si21(:,:,:,1);
    siji=fac.*((siji(:,:,:,1)-mn)./(mx-mn));
    sis2M=zeros(207,176,176-15);
    sis2M(8:size(sis.img,1)+8-1,1:176-7,1:176-7)=double(sis.img(:,8:176,8:end,1));
    sis21M=sis2M(15:207,1:176-7,1:176-15);


%     toop=(toop(20:135,20:135,:));
%     toopG=(toopG(20:135,20:135,:));
%     spa21=(spa21(20:135,20:135,:));
%     r11=(r11(20:135,20:135,:));
%     paper16=(paper16(20:135,20:135,:));
    r11h=imhistmatchn(r11,toop); r11h=r11h.*r11M;
    spa21h=imhistmatchn(spa21,toop); spa21h=spa21h.*spa21M;
    paper16h=imhistmatchn(paper16,toop); paper16h=paper16h.*paper16M;
        sish=imhistmatchn(siji,toop); siji=siji.*sis21M;

    [Ps(i)] = EdgeModelBasedIQA(r11h);
    [Ss(i)] = EdgeModelBasedIQA(spa21h);
    [P16s(i)] = EdgeModelBasedIQA(paper16h);
    [SIs(i)] = EdgeModelBasedIQA(sish);
end