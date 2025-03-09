
oI = imread('C:\Users\giris\Downloads\building.pnm');
numPixels = numel(oI);
figure;
imshow(oI);
title('Original Image');
equalizedImage = uint8(zeros(size(oI)));
frequencies = zeros(255,1);
cdf = zeros(255,1);
cdfScaled = zeros(255,1);
for i = 1:size(oI,1)
    for j = 1:size(oI,2)
        value = oI(i,j);
        frequencies(value+1) = frequencies(value+1) + 1;
    end
end
cdf(1) = frequencies(1);
for i = 2:size(frequencies)
    cdf(i) = cdf(i-1) + frequencies(i);
end
cdfScaled = cdf / numPixels;
equalizedValues = round(cdfScaled * 255);
for i = 1:size(oI,1)
    for j = 1:size(oI,2)
        equalizedImage(i,j) = equalizedValues(oI(i,j)+1);
    end
end
figure;
imshow(equalizedImage);
title('Histogram Equalization');
