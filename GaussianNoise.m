     clear all;
     close all;
     clc;
    zh1 = imread('i1.jpg');
    j = imnoise(zh1,'gaussian',0, 0.003);
    k = filter2(fspecial('average', 3), j)/255;
    l= medfilt2(j, [3 3]);
    m= wiener2(j, [3 3]);
    
   [psnrj]=psnr(j,zh1);
   [psnrk]=psnr(k,zh1);
   [psnrl]=psnr(l,zh1);
   [psnrm]=psnr(m,zh1);
   
   fprintf('\n PSNR Value noise image = %0.4f', psnrj);
   fprintf('\n PSNR Value average filter image  = %0.4f',psnrk);
   fprintf('\n PSNR Value median filter image  = %0.4f',psnrl);
   fprintf('\n PSNR Value wiener filter image  = %0.4f',psnrm);
   
   subplot(2,3,1),imshow(zh1);title('original  image');
   subplot(2,3,2),imshow(j);title('Gaussian noise image');
   subplot(2,3,3),imshow(k);title('after applying average filter');
   subplot(2,3,4),imshow(l);title('after applying median filter');
   subplot(2,3,5),imshow(m);title('after applying wiener filter');


