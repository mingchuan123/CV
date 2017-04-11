function [img]=Reconstruction(py) %#ok<*INUSD,*STOUT>
 
for i=length(py)-1:-1:1
    py{i}=py{i}+Expand(py{i+1});

end
img=py{1};
end