I = imread('C:\Users\giris\Downloads\child.pnm');
out_img = gaussian_filter(I, 4);
figure;
subplot(1, 2, 1), imshow(I), title('Original Image');
subplot(1, 2, 2), imshow(uint8(out_img)), title('Filtered Image with Gaussian Filter (sigma=4)');
function out_img = gaussian_filter(I, sigma)
    mask_size = ceil(sigma * 3) * 2 + 1;
    mask_center = (mask_size + 1) / 2;
    [X, Y] = meshgrid(1:mask_size, 1:mask_size);
    mask = exp(-((X - mask_center).^2 + (Y - mask_center).^2) / (2 * sigma^2));
    mask = mask / sum(mask(:));
    num_channels = size(I, 3);
    out_img = zeros(size(I));
    for channel = 1:num_channels
        out_img(:, :, channel) = conv2(I(:, :, channel), mask, 'same');
    end
end
