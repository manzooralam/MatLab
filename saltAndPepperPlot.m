    clear all;
     close all;
     clc;
    zh1 = imread('i1.jpg');
     j1 = imnoise(zh1,'salt & pepper', 0.01);
     j2 = imnoise(zh1,'salt & pepper', 0.02);
     j3 = imnoise(zh1,'salt & pepper', 0.03);
     
    k1 = filter2(fspecial('average', 3), j1)/255;
    k2 = filter2(fspecial('average', 3), j2)/255;
    k3 = filter2(fspecial('average', 3), j3)/255;
    
    l1= medfilt2(j1, [3 3]);
    l2 = medfilt2(j2, [3 3]);
    l3 = medfilt2(j3, [3 3]);
    
    m1= wiener2(j1, [3 3]);
    m2= wiener2(j2, [3 3]);
    m3= wiener2(j3, [3 3]);
    
   [psnrj1]=psnr(j1,zh1);
   [psnrj2]=psnr(j2,zh1);
   [psnrj3]=psnr(j3,zh1);
   
   [psnrk1]=psnr(k1,zh1);
   [psnrk2]=psnr(k2,zh1);
   [psnrk3]=psnr(k3,zh1);
   
   [psnrl1]=psnr(l1,zh1);
   [psnrl2]=psnr(l2,zh1);
   [psnrl3]=psnr(l3,zh1);
   
   [psnrm1]=psnr(m1,zh1);
   [psnrm2]=psnr(m2,zh1);
   [psnrm3]=psnr(m3,zh1);
   
   
    x= [1:3];
    y= [psnrk1,psnrk2,psnrk3];
    z= [psnrl3, psnrl3,psnrl3];
    t= [psnrm1,psnrm2,psnrm3]
   
   y1= plot(x,y);  hold all;
   z1= plot(x,z); hold all;
   t1= plot(x,t);hold all;
   
   
    set(y1, 'color', 'red', 'lineWidth', 2);
    set(z1, 'color', 'green', 'lineWidth', 2);
    set(t1, 'color', 'blue', 'lineWidth', 2);
    
     legend('Average Filter',' Median Filter','Weiner Filter');
   
   
   xlabel('Digital Images'), ylabel('PSNR'), title('salt and pepper Ploat');
   
   %{
   x= [1:14];
   y= [psnrj1,psnrk1,psnrl1,psnrm1, 0,psnrj2,psnrk2,psnrl2, psnrm2,0, psnrj3, psnrk3,psnrl3,psnrm3 ];
   
   bar(x,y), xlabel('Digital Images'), ylabel('PSNR'), title('Salt & pepper Ploat');
   %}
   
   %{
   
    x= [1:4];
    y= [psnrj1,psnrk1,psnrl1,psnrm1];
    z= [psnrj2,psnrk2,psnrl2, psnrm2];
    t= [ psnrj3, psnrk3,psnrl3,psnrm3];
   
   y1= plot(x,y);  hold all;
   z1= plot(x,z); hold all;
   t1= plot(x,t);
    set(y1, 'color', 'red', 'lineWidth', 2);
    set(z1, 'color', 'yellow', 'lineWidth', 2);
    set(t1, 'color', 'blue', 'lineWidth', 2);
   
   xlabel('Digital Images'), ylabel('PSNR'), title('Salt $ Pepper Ploat');
   
   %}
   
  