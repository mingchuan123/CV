%All programs start from mosaic.
%Image Mosaic and mosaic are the two output image.
%Program uses mgput to extract four points manually.
%Program uses affine transformaton to warp image.
%Program uses Blend to merge the image.

im=im2double(imread('4.JPG'));
in=im2double(imread('5.JPG'));
imga=im2double(imresize(im,[2200,2000]));
imgb=im2double(imresize(in,[2200,2000]));
X=mgput(imga,imgb);
M=zeros(3,3);
M(1,1)=X(1);
M(2,2)=X(1);
M(1,2)=-X(2);
M(2,1)=X(2);
M(1,3)=X(3);
M(2,3)=X(4);
M(3,3)=1;
N=[500,400,3];
%imgaa=zeros(500,400);
%imgbb=zeros(500,400);
I=[3,1];
for i=1:3
    for j=1:2200
        for p=1:2000
            I=M*[j,p,1]';
            m=round(max(I(1)));
            n=round(max(I(2)));
            if (m>0 && n>0)
            N(m,n,i)=imga(j,p,i);
            end
        end
    end
end
imga=im2double(imresize(N,[2000,1700]));
imgb=im2double(imresize(imgb,[2000,1700]));
%N=imresize(N,[350,200]);
%imga=imresize(imga,[350,200]);
%figure,imshow(N);
%[Q,W]=ginput(1);
%imshow(imga);
%[G,H]=ginput(1);
%O=[1000,800];
V=cell(1,1);
V{1}=imga;
imga1=Reconstruction(V);
O=Blend(imga1,imgb);
O=imresize(O,[1000,800]);
imshow(O);