%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图像处理实验二
% 张家奇 15031204 150324班
% 边缘提取(任务二)
% 2018.04.24
% 注：若直接运行，会进行所有算子的卷及操作并生成所有图片，时间较长,
%     建议分小节分别运行。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img_name='lena.bmp';
img_ori=imread(img_name);
mask_sobel_h=[1,2,1;0,0,0;-1,-2,-1];    % set masks: sobel operater
mask_sobel_v=mask_sobel_h';
fil=fspecial('sobel');  % use the matlab's function to distract edge to test the effect of myself function
edge_sobel_h=edgedis(img_ori,mask_sobel_h,60);
edge_sobel_v=edgedis(img_ori,mask_sobel_v,80);
%% compare effects of different thresholds
% figure(1),subplot(3,3,1);imshow(edge_sobel_h);title('Threshold=10');
% subplot(3,3,2);imshow(edgedis(img_ori,mask_sobel_h,20));title('Threshold=20');subplot(3,3,3);imshow(edgedis(img_ori,mask_sobel_h,30));title('Threshold=30');
% subplot(3,3,4);imshow(edgedis(img_ori,mask_sobel_h,40));title('Threshold=40');subplot(3,3,5);imshow(edgedis(img_ori,mask_sobel_h,50));title('Threshold=50');
% subplot(3,3,6);imshow(edgedis(img_ori,mask_sobel_h,60));title('Threshold=60');subplot(3,3,7);imshow(edgedis(img_ori,mask_sobel_h,70));title('Threshold=70');
% subplot(3,3,8);imshow(edgedis(img_ori,mask_sobel_h,80));title('Threshold=80');subplot(3,3,9);imshow(edgedis(img_ori,mask_sobel_h,90));title('Threshold=90');
% figure(2),imshow(edge(img_ori,'sobel',0.1 ));title('matlab sobel function');
%% compare effects of horizontal sobel, vertical sobel L1 nomalized sobel and L2 nomalized sobel
L1norm=syn_conv(img_ori,mask_sobel_h,mask_sobel_v,'L1',150);
L2norm=syn_conv(img_ori,mask_sobel_h,mask_sobel_v,'L2',150);
figure(3),subplot(2,2,1);imshow(edge_sobel_h);title('horizontal sobel');
subplot(2,2,2);imshow(edge_sobel_v);title('vertical sobel');
subplot(2,2,3);imshow(L1norm);title('L1 normal sobel');
subplot(2,2,4);imshow(L2norm);title('L2 normal sobel');
%% laplace operater experiment
% mask_laplace_4near=[0,1,0;1,-4,1;0,1,0];
% mask_laplace_8near=[1,1,1;1,-8,1;1,1,1];
% mask_laplace_central1=[2,-1,2;-1,-4,-1;2,-1,2];
% mask_laplace_central2=[-1,2,-1;2,-4,2;-1,2,-1];
% conv_laplace4=edgedis(img_ori,mask_laplace_4near,7); % convolute image with mask
% conv_laplace8=edgedis(img_ori,mask_laplace_8near,31); % convolute image with mask
% conv_laplace_c1=edgedis(img_ori,mask_laplace_central1,30); % convolute image with mask
% conv_laplace_c2=edgedis(img_ori,mask_laplace_central2,5); % convolute image with mask
% figure(4),subplot(2,2,1);imshow(conv_laplace4);title('4-near laplace');
% subplot(2,2,2);imshow(conv_laplace8);title('8-near laplace');
% subplot(2,2,3);imshow(conv_laplace_c1);title('central laplace 1');
% subplot(2,2,4);imshow(conv_laplace_c2);title('central laplace 2');
%% Kirsch operater experiment
% mask_kirsch_s=[3,3,3;3,0,3;-5,-5,-5];
% mask_kirsch_sw=[3,3,3;-5,0,3;-5,-5,3];
% mask_kirsch_w=[-5,3,3;-5,0,3;-5,3,3];
% mask_kirsch_wn=[-5,-5,3;-5,0,3;3,3,3];
% mask_kirsch_n=[-5,-5,-5;3,0,3;3,3,3];
% mask_kirsch_ne=[3,-5,-5;3,0,-5;3,3,3];
% mask_kirsch_e=[3,3,-5;3,0,-5;3,3,-5];
% mask_kirsch_es=[3,3,3;3,0,-5;3,-5,-5];
% conv_kirsch_s=edgedis(img_ori,mask_kirsch_s,150); % convolute image with different mask
% conv_kirsch_sw=edgedis(img_ori,mask_kirsch_sw,150);
% conv_kirsch_w=edgedis(img_ori,mask_kirsch_w,150);
% conv_kirsch_wn=edgedis(img_ori,mask_kirsch_wn,150);
% conv_kirsch_n=edgedis(img_ori,mask_kirsch_n,150); 
% conv_kirsch_ne=edgedis(img_ori,mask_kirsch_ne,150);
% conv_kirsch_e=edgedis(img_ori,mask_kirsch_e,150);
% conv_kirsch_es=edgedis(img_ori,mask_kirsch_es,150);
% figure(5),subplot(2,2,1);imshow(conv_kirsch_s);title('Sorth');
% subplot(2,2,2);imshow(conv_kirsch_sw);title('SouthWest');
% subplot(2,2,3);imshow(conv_kirsch_w);title('West');
% subplot(2,2,4);imshow(conv_kirsch_wn);title('NorthWest');
% figure(6),subplot(2,2,1);imshow(conv_kirsch_n);title('North');
% subplot(2,2,2);imshow(conv_kirsch_ne);title('NorthEast');
% subplot(2,2,3);imshow(conv_kirsch_e);title('East');
% subplot(2,2,4);imshow(conv_kirsch_es);title('SouthEast');
% kirsch_L1norm=syn_conv(img_ori,mask_kirsch_s,mask_kirsch_w,'L1',254);    % combine south and west operater
% kirsch_L2norm=syn_conv(img_ori,mask_kirsch_s,mask_kirsch_w,'L2',254);
% figure(7),subplot(1,2,1);imshow(kirsch_L1norm);title('L1 normal kirsch');
% subplot(1,2,2);imshow(kirsch_L2norm);title('L2 normal kirsch');
%% edge disctraction functions,including convolution function,threshold function,transfer gray function,padding function and synthesis function
function [edge_img]=edgedis(img,mask,thresh)    % edge detection by mask and thresh
ave_fil=fspecial('average',[3 3]);
img_smooth=imfilter(img,ave_fil);   % average filter
% img_smooth=medfilt2(img);   % mid number filter
[m,n]=size(mask);
y=floor(m/2);
x=floor(n/2);
padimg=zero_padding(img_smooth,y,x);   % add padding according to the size of mask
conv=convolution(padimg,mask);    % convulute image with mask
conv_gray=uint8(trans_gray(conv));
edge_img=threhold(conv_gray,thresh);
end

function [img_conv]=convolution(img,mask)    % convolute image(after padding) and mask
[height,width,flag]=size(img);  % get the width,height of the input image
[m,n]=size(mask);
ini_y=ceil(m/2);    % calculate high bound and low bound of half of the mask
ini_x=ceil(n/2);
uin_y=floor(m/2);
uin_x=floor(n/2);
img_conv=zeros(height-2*uin_y,width-2*uin_x,flag);
for h=1:flag
    for i=ini_y:height-uin_y
        for j=ini_x:width-uin_x
            tmp=0;
            for y=1:m
                for x=1:n
                    tmp=tmp+mask(y,x)*img(i-uin_y+y-1,j-uin_x+x-1,h);
                    img_conv(i-uin_y,j-uin_x,h)=tmp;  % convolution mask and image
                end
            end
        end
    end
end
end

function [padimage]=zero_padding(img,x,y) % increase z paddings around the image
[height,width,flag]=size(img);  % get the width,height and channel of the input image
padimage=zeros(height+2*y,width+2*x,flag);
for p=1:flag
    for i=1:height
        for j=1:width
            padimage(i+y,j+x,p)=img(i,j,p); % increase paddings around image
        end
    end
end
end

function [conv_gray]=trans_gray(conv)   % transfer multichannel image to gray image
[~,~,flag]=size(conv);  % channel of the convoluted image
if flag==1
    conv_gray=conv;
else
    conv_gray=rgb2gray(conv); % transfer the convoluted image to gray
end
end

function [img]=threhold(img,level)  % use threhold to divide image
[height,width,flag]=size(img);
for k=1:flag
    for i=1:height
        for j=1:width
            if img(i,j,k)>level
                img(i,j,k)=255;
            else
                img(i,j,k)=0;
            end
        end
    end
end
end
% conv an image with two kinds of masks and normalize these two image with
% different norm. L1 is L1 norm, L2 is L2 norm
function [edge_img]=syn_conv(img_ori,mask1,mask2,type,thresh)  
[m,n]=size(mask1);
y=floor(m/2);
x=floor(n/2);
padimg=zero_padding(img_ori,y,x);   % add padding according to the size of mask
conv1=convolution(padimg,mask1); 
conv_gray1=trans_gray(conv1);
conv2=convolution(padimg,mask2); 
conv_gray2=trans_gray(conv2);
if type=='L1'
    normalize=abs(conv_gray1)+abs(conv_gray2);  % if type==L1,reture the image with L1 norm
else
    if type=='L2'
    normalize=sqrt(conv_gray1.^2+conv_gray2.^2);    % if type==L2,reture the image with L2 norm
    end
end
conv_gray=uint8(normalize);
edge_img=threhold(conv_gray,thresh);
end