%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图像处理实验一
% 张家奇 15031204 150324班
% 为图像添加不同强度的高斯噪声并分别用中值滤波和均值滤波去噪（自主探究）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
image_name='lena.bmp';%图像名字
image=imread(image_name);% 读取图像
figure(1),imshow(image),title('Original');
image_gaus1=imnoise(image,'gaussian',0,0.01);%添加不同强度的高斯噪声，第一个数为噪声均值，第二个数为噪声方差
image_gaus2=imnoise(image,'gaussian',0,0.02);
image_gaus3=imnoise(image,'gaussian',0,0.1);
image_gaus4=imnoise(image,'gaussian',0.01,0.01);
image_gaus5=imnoise(image,'gaussian',0.01,0.02);
image_gaus6=imnoise(image,'gaussian',0.01,0.1);
image_gaus7=imnoise(image,'gaussian',0.1,0.01);
image_gaus8=imnoise(image,'gaussian',0.1,0.02);
image_gaus9=imnoise(image,'gaussian',0.1,0.1);
figure(2),subplot(3,3,1),imshow(image_gaus1),title('ave=0, var=0.01');%显示添加噪声之后的图片
subplot(3,3,2),imshow(image_gaus2),title('ave=0, var=0.02');
subplot(3,3,3),imshow(image_gaus3),title('ave=0, var=0.1');
subplot(3,3,4),imshow(image_gaus4),title('ave=0.01, var=0.01');
subplot(3,3,5),imshow(image_gaus5),title('ave=0.01, var=0.02');
subplot(3,3,6),imshow(image_gaus6),title('ave=0.01, var=0.1');
subplot(3,3,7),imshow(image_gaus7),title('ave=0.1, var=0.01');
subplot(3,3,8),imshow(image_gaus8),title('ave=0.1, var=0.02');
subplot(3,3,9),imshow(image_gaus9),title('ave=0.1, var=0.1');
image_filt1=medfilt2(image_gaus1);%中值滤波
image_filt2=medfilt2(image_gaus2);
image_filt3=medfilt2(image_gaus3);
image_filt4=medfilt2(image_gaus4);
image_filt5=medfilt2(image_gaus5);
image_filt6=medfilt2(image_gaus6);
image_filt7=medfilt2(image_gaus7);
image_filt8=medfilt2(image_gaus8);
image_filt9=medfilt2(image_gaus9);
figure(3),subplot(3,3,1),imshow(image_filt1),title('filtered ave0,var0.01');%显示中值滤波之后的图片
subplot(3,3,2),imshow(image_filt2),title('filtered ave0,var0.02');
subplot(3,3,3),imshow(image_filt3),title('filtered ave0,var0.1');
subplot(3,3,4),imshow(image_filt4),title('filtered ave0.01,var0.01');
subplot(3,3,5),imshow(image_filt5),title('filtered ave0.01,var0.02');
subplot(3,3,6),imshow(image_filt6),title('filtered ave0.01,var0.1');
subplot(3,3,7),imshow(image_filt7),title('filtered ave0.1,var0.01');
subplot(3,3,8),imshow(image_filt8),title('filtered ave0.1,var0.02');
subplot(3,3,9),imshow(image_filt9),title('filtered ave0.1,var0.1');
kernel=[1,1,1;1,1,1;1,1,1];%构建中值滤波核函数
kernel=kernel/9;
image_filt11=conv2(double(image_gaus1),kernel)/255;%均值滤波
image_filt22=conv2(double(image_gaus2),kernel)/255;
image_filt33=conv2(double(image_gaus3),kernel)/255;
image_filt44=conv2(double(image_gaus4),kernel)/255;
image_filt55=conv2(double(image_gaus5),kernel)/255;
image_filt66=conv2(double(image_gaus6),kernel)/255;
image_filt77=conv2(double(image_gaus7),kernel)/255;
image_filt88=conv2(double(image_gaus8),kernel)/255;
image_filt99=conv2(double(image_gaus9),kernel)/255;
figure(4),subplot(3,3,1),imshow(image_filt11),title('ave filtered ave0,var0.01');%显示中值滤波之后的图片
subplot(3,3,2),imshow(image_filt22),title('ave filtered 0,0.02');
subplot(3,3,3),imshow(image_filt33),title('ave filtered 0,0.1');
subplot(3,3,4),imshow(image_filt44),title('ave filtered 0.01,0.01');
subplot(3,3,5),imshow(image_filt55),title('ave filtered 0.01,0.02');
subplot(3,3,6),imshow(image_filt66),title('ave filtered 0.01,0.1');
subplot(3,3,7),imshow(image_filt77),title('ave filtered 0.1,0.01');
subplot(3,3,8),imshow(image_filt88),title('ave filtered 0.1,0.02');
subplot(3,3,9),imshow(image_filt99),title('ave filtered 0.1,0.1');
