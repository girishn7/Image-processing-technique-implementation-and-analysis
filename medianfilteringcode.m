
I = imread('C:\Users\giris\Downloads\ct_scan.pnm');
imshow(I); title('Original Image');
I = imnoise(I,'salt & pepper',0.2);
figure   
imshow(I);   
J = medfilt3(I,[3,3,3]); 
imshow(I);
title('Noisy Image');
figure   
imshow(J); title('Median filtered image')
