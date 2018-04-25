%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图像处理实验二
% 张家奇 15031204 150324班
% 大津阈值图像分割(任务一)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img_name='cells.bmp';
img_ori=imread(img_name);
img_gray=rgb2gray(img_ori);
[T_rgb,div_rgb]=level_select(img_ori,256);  % rgb image divide
[T_gray,div_gray]=level_select(img_gray,256);   % gray image divide
level_sel=graythresh(img_ori);
div_sel=imbinarize(img_gray,level_sel);
figure(1),subplot(2,2,1);imshow(img_ori);title('Original image');
subplot(2,2,2);imshow(div_rgb);title('RGB divided image');
subplot(2,2,3);imshow(img_gray);title('Gray image');
subplot(2,2,4);imshow(div_gray);title('Gray divided image');
figure(2),subplot(2,2,1);imshow(img_ori);title('原始图片');
subplot(2,2,2);imshow(img_gray);title('灰度图');
subplot(2,2,3);imshow(div_sel);title('自带函数分割图 t=180');
subplot(2,2,4);imshow(div_gray);title('自行编写程序分割图 t=199');
figure(3),subplot(2,2,1);imshow(img_ori);title('original');
subplot(2,2,2);imshow(div_sel);title('matlab function');
subplot(2,2,3);imshow(delet_b(div_rgb));title('Myself function RGB');
subplot(2,2,4);imshow(rgb2gray(delet_b(div_rgb)));title('Myself function gray');

function [dele_b]=delet_b(div_rgb)  % noise Inhibition function
[height,width,~]=size(div_rgb);
for j=1:width
    for i=1:height
        if div_rgb(i,j,3)==255    % delete pixels that are only divided in B channel
            if div_rgb(i,j,1)~=255||div_rgb(i,j,2)~=255
                div_rgb(i,j,1)=255;
                div_rgb(i,j,2)=255;
            end
        end
    end
end
dele_b=div_rgb;
end
    
function [T,img_new]=level_select(img,N)    % calculate and reture level and divide image
[height,width,flag]=size(img);  % get the width,height and channel of the image
H=zeros(flag,N); % initial hitogram matrix
for k=1:flag
    for j=1:width
        for i=1:height
            tmp=img(i,j,k);
            H(k,tmp+1)=H(k,tmp+1)+1;    % caculate hitogram matrix
        end
    end
end
G=zeros(flag,N);    % initial accumulated hitogram matrix
for k=1:flag
    G(k,1)=H(k,1);
    for m=2:N
        G(k,m)=H(k,m)+G(k,m-1); % caculate accumulated hitogram matrix
    end
end
w1=zeros(1,flag); % initial averages and probobilities
w2=zeros(1,flag);
ave0=zeros(1,flag);
ave1=zeros(1,flag);
ave2=zeros(1,flag);
T=zeros(1,flag);
for k=1:flag
    var_max=0;
    for t=0:N-2
        w1(k)=G(k,t+1)/(width*height);    % calculate the probabilities of two parts of the image
        w2(k)=1-w1(k);
        tmp=0;
        for i=0:t
            tmp=tmp+i*H(k,i+1);     % sum of value of pixels in part 1 
        end
        if G(k,t+1)==0
            avel(k)=0;
        else
            ave1(k)=tmp/G(k,t+1);         % average of value of pixels in part 1
        end
        tmp=0;
        for i=t+1:N-1
            tmp=tmp+i*H(k,i+1);     % sum of value of pixels in part 2
        end
        if G(k,N)-G(k,t+1)==0
            ave2(k)=0;
        else
            ave2(k)=tmp/(G(k,N)-G(k,t+1));   % average of value of pixels in part 2
        end
        ave0(k)=w1(k)*ave1(k)+w2(k)*ave2(k);
        var_tmp=w1(k)*w2(k)*(ave1(k)-ave2(k))^2;
        if var_tmp>var_max
            var_max=var_tmp;
            T(k)=t;
        end
    end
end

img_new=img;
for k=1:flag
    for j=1:width
        for i=1:height
            if img(i,j,k)<T(k)     % divided the image according to value
                img_new(i,j,k)=0;
            else
                img_new(i,j,k)=N-1;
            end
        end
    end
end
end
