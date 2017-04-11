function [py] = GenPyramid(I,type,n)%#ok<*INUSL,*INUSD,*STOUT>
Gau=im2double(I);
py=cell(1,n);
py{1}=Gau;
for i=2:n
    py{i}=Reduce(py{i-1});
    
end

if strcmp(type,'gauss'),return,end;

for i=n-1:-1:1
    sz=2*size(py{i+1})-1;
    py{i}=py{i}(1:sz(1),1:sz(2),:); %adjust the size of the bigger image;
end

for i=1:1:n-1
    py{i}=py{i}-Expand(py{i+1});
    
end