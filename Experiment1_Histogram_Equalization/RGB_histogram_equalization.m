%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图像处理实验一
% 张家奇 15031204 150324班
% 直方图均衡化(任务二)(Part 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%对目标彩色图片进行直方图均衡化
img_name='street.png';
img=imread(img_name);
[height,width,flag]=size(img);
full_equ=img;
for i=1:flag
    img_layer=img(:,:,i);
    img_equ=histogram_equalization(img_layer);
    figure(i),subplot(2,2,1);imshow(img_layer);title(['Original layer',num2str(i)]);
    subplot(2,2,2);imhist(img_layer);title(['Histogram of ori',num2str(i)]);
    subplot(2,2,3);imshow(img_equ);title(['equalized layer',num2str(i)]);
    subplot(2,2,4);imhist(img_equ);title(['Histogram of equa',num2str(i)]);
    full_equ(:,:,i)=img_equ;
end
figure(i+1);subplot(1,2,1);imshow(img);title(['Original image',num2str(i)]);
    subplot(1,2,2);imshow(full_equ);title(['equalized image',num2str(i)]);
