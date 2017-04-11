imga=imread('IMG_1001.JPG');
imgb=imread('IMG_1002.JPG');
imga=im2double(imresize(imga,[400,500]));
imgb=im2double(imresize(imgb,[400,500]));
figure,imshow(imga);
[M,N]=ginput(3);
PA=[M,N]';
figure,imshow(imgb);
[E,F]=ginput(3);
PB=[E,F]';
Pb=reshape(PB,[],1);
A=zeros(6,4);
for i =1:3
    A(2*i-1,:)=[PA(1,i) -PA(2,i) 1 0];
    A(2*i,:)=[PA(2,i) PA(1,i) 0 1];
end
X=A\Pb;
