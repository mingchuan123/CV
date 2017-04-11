function imgout=Blend(imga,imgb)
%imgaa=imread(im);
%imgbb=imread(in);
%imga=im2double(imgaa);
%imgb=im2double(imgbb);
sz=size(imgb);
imga=imresize(imga,[sz(1),sz(2)]);
[M,N ~]=size(imga);

%rect = getrect(imga);
%siz=size(rect);
%c=siz(2);
c=600;
%d=224;
n=5;
limga=GenPyramid(imga,'lap',n);
limgb=GenPyramid(imgb,'lap',n);
%imshow(limga{2});
%imshow(limgb{1});

maska=zeros(size(imga));
maska(:,1:c,:)=1;
%maskb(:,d:sz(2),:)=1;
%maskb=1-maska;
blur=fspecial('gauss',2,2);
maska=imfilter(maska,blur,'symmetric');
%maskb=imfilter(maskb,blur,'symmetric');
maskb=1-maska;
limgc=cell(1,n);
for i=1:n
    [M,N ~]=size(limga{i});
    maska=imresize(maska,[M,N]);
    maskb=imresize(maskb,[M,N]);
    %K=zeros(2*M-1,2*N-1);
    %K=cat(2,limga{i},limgb{i});
    %limgc{i}=imresize(K,[2*M-1,2*N-1]);
    limgc{i}=limga{i}.*maska+limgb{i}.*maskb;
    %imshow(limgc{i});
end

imgout=Reconstruction(limgc);