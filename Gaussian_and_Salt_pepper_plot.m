    
     clear all;
     close all;
     clc;
    zh = imread('i2.jpg');
     zh1= rgb2gray(zh);
     j1 = imnoise(zh1,'gaussian',0, 0.01);
     j2 = imnoise(zh1,'gaussian',0, 0.02);
     j3 = imnoise(zh1,'gaussian',0, 0.03);
     
      j11 = imnoise(zh1,'salt & pepper', 0.01);
      j22 = imnoise(zh1,'salt & pepper', 0.02);
      j33 = imnoise(zh1,'salt & pepper', 0.03);
     
    k1 = filter2(fspecial('average', 3), j1)/255;
    k2 = filter2(fspecial('average', 3), j2)/255;
    k3 = filter2(fspecial('average', 3), j3)/255;
    
     k11 = filter2(fspecial('average', 3), j11)/255;
     k22 = filter2(fspecial('average', 3), j22)/255;
     k33 = filter2(fspecial('average', 3), j33)/255;
    
    l1= medfilt2(j1, [3 3]);
    l2 = medfilt2(j2, [3 3]);
    l3 = medfilt2(j3, [3 3]);
    
    l11= medfilt2(j11, [3 3]);
    l22 = medfilt2(j22, [3 3]);
    l33 = medfilt2(j33, [3 3]);
    
    m1= wiener2(j1, [3 3]);
    m2= wiener2(j2, [3 3]);
    m3= wiener2(j3, [3 3]);
    
     m11= wiener2(j11, [3 3]);
     m22= wiener2(j22, [3 3]);
     m33= wiener2(j33, [3 3]);
    
   [psnrj1]=psnr(j1,zh1);
   [psnrj2]=psnr(j2,zh1);
   [psnrj3]=psnr(j3,zh1);
   
    [psnrj11]=psnr(j11,zh1);
    [psnrj22]=psnr(j22,zh1);
    [psnrj33]=psnr(j33,zh1);
   
   [psnrk1]=psnr(k1,zh1);
   [psnrk2]=psnr(k2,zh1);
   [psnrk3]=psnr(k3,zh1);
   
      [psnrk11]=psnr(k11,zh1);
    [psnrk22]=psnr(k22,zh1);
    [psnrk33]=psnr(k33,zh1);
   
   [psnrl1]=psnr(l1,zh1);
   [psnrl2]=psnr(l2,zh1);
   [psnrl3]=psnr(l3,zh1);
    
     [psnrl11]=psnr(l11,zh1);
   [psnrl22]=psnr(l22,zh1);
   [psnrl33]=psnr(l33,zh1);
   
   [psnrm1]=psnr(m1,zh1);
   [psnrm2]=psnr(m2,zh1);
   [psnrm3]=psnr(m3,zh1);
   
    [psnrm11]=psnr(m11,zh1);
   [psnrm22]=psnr(m22,zh1);
   [psnrm33]=psnr(m33,zh1);
   
   
   %{
   x= [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
   y= [psnrj1,psnrk1,psnrl1,psnrm1, 0,psnrj2,psnrk2,psnrl2, psnrm2,0, psnrj3, psnrk3,psnrl3,psnrm3 ];
   
   bar(x,y), xlabel('Digital Images'), ylabel('PSNR'), title('Gaussian Ploat');
   
  
   
  %}

  x= [1:3];
    y= [psnrk1,psnrk2,psnrk3];
    z= [psnrl3, psnrl3,psnrl3];
    t= [psnrm1,psnrm2,psnrm3];
    
    yy= [psnrk11,psnrk22,psnrk33];
    zz= [psnrl33, psnrl33,psnrl33];
    tt= [psnrm11,psnrm22,psnrm33]
   
   y1= plot(x,y);  hold all;
    y11= plot(x,yy);  hold all;
   z1= plot(x,z); hold all;
    z11= plot(x,zz); hold all;
   t1= plot(x,t);hold all;
   
   
   
    t11= plot(x,tt);hold all;
   
   
    set(y1, 'color', 'red', 'lineWidth', 2);
     set(y11, 'color', 'red', 'lineWidth', 2, 'LineStyle', '- -');
    set(z1, 'color', 'green', 'lineWidth', 2);
     set(z11, 'color', 'green', 'lineWidth', 2, 'LineStyle', '- -');
    set(t1, 'color', 'blue', 'lineWidth', 2);
        set(t11, 'color', 'blue', 'lineWidth', 2, 'LineStyle', '- -');
    
    legend('G.S.Average Filter','S.P.Average Filter','G.S. Median Filter',' S.P.Median Filter','G.S.Weiner Filter','S.P.Weiner Filter');
  
   
   
   xlabel('Digital Images'), ylabel('PSNR'), title('Gaussian noise(G.S.) And Salt & Pepper noise(S.P.) with filters'); 
    
   


