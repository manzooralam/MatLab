clear all;
clc;
im = imread('eight.tif');
im1 = imnoise(im,'salt & pepper', 0.02);
K = filter2(fspecial('average', 3), im1)/255;
L= medfilt2(im1, [3 3]);
[psnr]= psnr(im1, im);
fprintf('filter= %0.4f', psnr);

subplot(3,2,1),imshow(im);    title('original image');
subplot(3,2,2),imshow(im1);   title('Salt & pepper image');
subplot(3,2,3),imshow(K);     title('filter2 of salt & noise image');
subplot(3,2,4),imshow(L);     title('medfilt2 of salt & noise image');
