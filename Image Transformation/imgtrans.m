imga=imread('IMG_1001.JPG');
imgb=imread('IMG_1002.JPG');
imga=im2double(imresize(imga,[400,500]));
imgb=im2double(imresize(imgb,[400,500]));
%imshow(imga);
%figure;
%imshow(imgb);
X=zeros(4,1);
PA=[6 111 14 117;168 161 290 244];
PB=[35 122 41 127;163 158 282 241];
Pb=reshape(PB,[],1);
A=zeros(8,4);

for i =1:4
    A(2*i-1,:)=[PA(1,i) -PA(2,i) 1 0];
    A(2*i,:)=[PA(2,i) PA(1,i) 0 1];
end
X=A\Pb;
