iI = imread('C:\Users\giris\Downloads\tire.pnm');
if size(iI, 3) == 3
    grayImage = rgb2gray(iI);
else
    grayImage = iI;
end
angleDegrees = 45;
angleRadians = deg2rad(angleDegrees);
center = floor(size(grayImage) / 2) + 1;
rotatedImage = zeros(size(grayImage));
for i = 1:size(rotatedImage, 1)
    for j = 1:size(rotatedImage, 2)
        x = (i - center(1)) * cos(angleRadians) - (j - center(2)) * sin(angleRadians) + center(1);
        y = (i - center(1)) * sin(angleRadians) + (j - center(2)) * cos(angleRadians) + center(2);
        
        if x >= 1 && x <= size(grayImage, 1) && y >= 1 && y <= size(grayImage, 2)
            x1 = floor(x);
            x2 = ceil(x);
            y1 = floor(y);
            y2 = ceil(y);
            
            f11 = grayImage(x1, y1);
            f12 = grayImage(x1, y2);
            f21 = grayImage(x2, y1);
            f22 = grayImage(x2, y2);
            
            w1 = (x2 - x) * (y2 - y);
            w2 = (x2 - x) * (y - y1);
            w3 = (x - x1) * (y2 - y);
            w4 = (x - x1) * (y - y1);
            
            interpolatedValue = w1 * f11 + w2 * f12 + w3 * f21 + w4 * f22;
            rotatedImage(i,j) = interpolatedValue;
        else
            rotatedImage(i,j) = 0;
        end
    end
end
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('Input Image');
subplot(1, 2, 2);
imshow(rotatedImage, []);
title('Rotated Image');
