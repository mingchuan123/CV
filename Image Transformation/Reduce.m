function [imgout]= Reduce(I) %#ok<*STOUT,*INUSD>
I=im2double(I);
cw = .375; % kernel centre weight, same as MATLAB func impyramid. 0.6 in the Paper
kernel = [.25-cw/2 .25 cw .25 .25-cw/2];
imgout=[];
sz=size(I);
for n=1:1:3
img1=imfilter(I(:,:,n),kernel,'symmetric','same');
img2=imfilter(img1,kernel','symmetric','same');
imgout(:,:,n)=img2(1:2:sz(1),1:2:sz(2));
end
end