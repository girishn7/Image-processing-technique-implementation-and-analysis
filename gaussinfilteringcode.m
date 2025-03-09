image = imread('C:\Users\giris\Downloads\child.pnm');
kernelSize = 8;
sigma = 1;
kernel = fspecial('gaussian', [kernelSize kernelSize], sigma);
image_double = im2double(image);
Iblur = imgaussfilt(image,2);
montage({image,Iblur})
title('Original Image (Left) Vs. Gaussian Filtered Image (Right)')