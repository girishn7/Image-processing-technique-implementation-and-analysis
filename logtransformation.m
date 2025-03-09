
oI = imread('C:\Users\giris\Downloads\building.pnm');
normalizedImage = double(oI) / 255;
scalingFactor1 = 2;
logTransformedImage1 = scalingFactor1 * log(1 + normalizedImage);
scalingFactor2 = 3;
logTransformedImage2 = scalingFactor2 * log(1 + normalizedImage);
figure;
subplot(1, 3, 1);
imshow(oI);
title('Original Image');
subplot(1, 3, 2);
imshow(logTransformedImage1);
title('Log-Transformed Image (c = 2)');
subplot(1, 3, 3);
imshow(logTransformedImage2);
title('Log-Transformed Image (c = 3)');