%All the programs start from main.
%Program uses Reduce,Expand to change the scale of images.
%Program uses GenPyramid to represent both Gaussian and Laplacian.
%Program uses Reconstruction to reconstruct image and Blend to blend image.


close all;
clc;

k=Blend('apple1.jpg','orange1.jpg')
imshow(k);