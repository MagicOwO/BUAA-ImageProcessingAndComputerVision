%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图像处理实验一
% 张家奇 15031204 150324班
% 为图像添加不同噪声并针对椒盐噪声分别用中值滤波和均值滤波去噪(任务一)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
image_name='lena.bmp';%图像名字
img=imread(image_name);% 读取图像
image_gauss=imnoise(img,'gaussian',0.02); %添加高斯噪声
salt_pepper_noise=imnoise(img,'salt & pepper',0.05); %添加椒盐噪声
salt_noise = im2uint8(randn(size(img)).*0.1); %生成随机噪声，并转化为unit8型
image_impulse=img+salt_noise;  %添加脉冲噪声
image_filter1=filter2(fspecial('average',3),salt_pepper_noise)/255;%均值滤波，并将数据缩放至（0,1）范围内
image_filter2 = medfilt2(salt_pepper_noise, [3 3]); %中值滤波
subplot(2,3,1); imshow(image_gauss); title('高斯噪声');%绘图并显示
subplot(2,3,2); imshow(salt_pepper_noise); title('椒盐噪声');
subplot(2,3,3); imshow(image_impulse); title('脉冲噪声');
subplot(2,3,4);imshow(img); title('原图');
subplot(2,3,5);imshow(image_filter1); title('椒盐噪声均值滤波');
subplot(2,3,6); imshow(image_filter2); title('椒盐噪声中值滤波');




