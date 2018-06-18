  clear all;
     close all;
     clc;
    zh = imread('i2.jpg');
    zh1 =rgb2gray(zh);
    j = imnoise(zh1,'salt & pepper', 0.02);
    k = filter2(fspecial('average', 3), j)/255;
    l= medfilt2(j, [3 3]);
    m= wiener2(j, [3 3]);
     figure,imhist(j);title('Noise image');
    figure, imhist(k);title('average filter image');
    figure, imhist(l);title('median filter image');
    figure, imhist(m);title('wiener filter image');
    
   
   