function [imgout]=Expand(Im) %#ok<*INUSD,*STOUT>
In=im2double(Im);
sz1=size(In);
sz=[2*sz1(1)-1,2*sz1(2)-1];
imgout=[sz(1),sz(2),3];

width = 5; % default kernel width
cw = .375; % kernel centre weight
ker1d = [.25-cw/2 .25 cw .25 .25-cw/2];
kernel = kron(ker1d,ker1d')*4;

%use four kernels to precess image
ker11=kernel(1:2:5,1:2:5);
ker12=kernel(2:2:4,1:2:5);
ker21=kernel(1:2:5,2:2:4);
ker22=kernel(2:2:4,2:2:4);
for i=1:1:size(In,3)
    img=In(:,:,i);
    imgpvlh=padarray(img,[0,1],'replicate','both');
    imgpvlv=padarray(img,[1,0],'replicate','both');
    
    img11=imfilter(img,ker11,'symmetric','same');
    img21=conv2(imgpvlh,ker12,'valid');
    img12=conv2(imgpvlv,ker21,'valid');
    img22=conv2(img,ker22,'valid');

imgout(1:2:sz(1),1:2:sz(2),i)=img11;
imgout(2:2:sz(1),1:2:sz(2),i)=img21;
imgout(1:2:sz(1),2:2:sz(2),i)=img12;
imgout(2:2:sz(1),2:2:sz(2),i)=img22;
end
end