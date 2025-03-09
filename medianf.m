img = imread('C:\Users\giris\Downloads\child.pnm');
noisy_image = imnoise(img, 'salt & pepper', 0.5);
filter_size = 5;
pad_size = floor(filter_size/2);
padded_img = padarray(noisy_image, [pad_size, pad_size], 'replicate');
output_img = zeros(size(noisy_image));

for i = 1:size(noisy_image, 1)
    for j = 1:size(noisy_image, 2)
        neighbourhood = padded_img(i:i+filter_size-1, j:j+filter_size-1);
        median_val = median(neighbourhood(:));
        output_img(i, j) = median_val;
    end
end

figure;
subplot(2,3,1); imshow(img); title('Original Image');
subplot(2,3,2); imshow(noisy_image); title('Noisy Image');
subplot(2,3,3); imshow(uint8(output_img)); title('Median Filtered Image');