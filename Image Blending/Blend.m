function imgout=Blend(im,in)
imgaa=imread(im);
imgbb=imread(in);
imga=im2double(imgaa);
imgb=im2double(imgbb);
sz=size(imgb);
imga=imresize(imga,[sz(1),sz(2)]);
[M,N ~]=size(imga);

%rect = getrect(imga);
%siz=size(rect);
%c=siz(2);
c=230;
n=5;
limga=GenPyramid(imga,'lap',n);
limgb=GenPyramid(imgb,'lap',n);
%imshow(limga{2});
%imshow(limgb{1});

maska=zeros(size(imga));
maska(:,1:c,:)=1;
%maskb=1-maska;
blur=fspecial('gauss',20,20);
maska=imfilter(maska,blur,'symmetric');
%maskb=imfilter(maskb,blur,'symmetric');
maskb=1-maska;

limgc=cell(1,n);
for i=1:n
    [M,N ~]=size(limga{i});
    maska=imresize(maska,[M,N]);
    maskb=imresize(maskb,[M,N]);
    limgc{i}=limga{i}.*maska+limgb{i}.*maskb;
    %imshow(limgc{i});
end

imgout=Reconstruction(limgc);

