function y=convolve(Im,H) %#ok<*STOUT,*INUSD>
In=imread(Im);
Ip=im2double(In);
I=rgb2gray(Ip);
[rows,columns]=size(I) %#ok<*NOPRT,*ASGLU>
[rowsx,columnsx]=size(H);
C=0;
a=0;
b=0;
d=0;
rowsy=rows-rowsx+1;
columnsy=columns-columnsx+1;
columnsy
c=zeros(rows,columns);
for k=1:1:rowsy
    for p=1:1:columnsy
        for i=1:1:rowsx
            for j=1:1:columnsx
                T=I(i+a,j+b)*H(i,j);
                C=C+T;
            end
        end
        c(k,p)=C;
        b=b+1;
        C=0;
    end
    a=a+1;
    b=0;
end
y=c;