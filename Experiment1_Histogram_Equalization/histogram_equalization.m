%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图像处理实验一
% 张家奇 15031204 150324班
% 直方图均衡化(任务二)(Part 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数功能：对有G个灰度级的图像灰度级图像进行直方图均衡化
% 输入：灰度图像（矩阵形式）
% 输出：直方图均衡化后的图像（矩阵形式）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [equaled_img]=histogram_equalization(img)
[height,width]=size(img);
G=256;                          % 灰度级个数
H=zeros(1,G);                   % 直方图矩阵
Hc=zeros(1,G);                  % 累积直方图矩阵
gmin=img(1,1);                  % gmin为图中像素的最小值，初始化gmin为图像的第一个像素的亮度
for i=1:height                   % 遍历像素点，形成图像直方图
    for j=1:width
        tmp=img(i,j);
        H(tmp+1)=H(tmp+1)+1;    % 注意，图像中的像素点范围是[0,255],而矩阵索引是从1开始，因此需要+1
        if gmin>tmp             % 若当前像素亮度小于gmin，则将当前像素的亮度赋值给gmin
            gmin=tmp;
        end
    end
end
Hc(1)=H(1);
for k=2:G
    Hc(k)=Hc(k-1)+H(k);         % 形成累积的直方图Hc
end
Hmin=Hc(gmin+1);                % 原图中灰度级最小的像素个数
T=zeros(1,G);
for m=1:G
    T(m)=round(((Hc(m)-Hmin)*(G-1))/((height*width)-Hmin));   %计算灰度级转换矩阵
end
equaled_img=img;
for i=1:height                  % 遍历像素点，重构一个灰度图像
    for j=1:width
        equaled_img(i,j)=T(img(i,j)+1);
    end
end
end
