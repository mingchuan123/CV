function X=mgput(imga,imgb)
figure,imshow(imga);
[M,N]=ginput(4);
PA=[M,N]';
figure,imshow(imgb);
[E,F]=ginput(4);
PB=[E,F]';
Pb=reshape(PB,[],1);
A=zeros(8,4);
for i =1:4
    A(2*i-1,:)=[PA(1,i) -PA(2,i) 1 0];
    A(2*i,:)=[PA(2,i) PA(1,i) 0 1];
end
X=A\Pb;
