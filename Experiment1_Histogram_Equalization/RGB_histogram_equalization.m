%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ͼ����ʵ��һ
% �ż��� 15031204 150324��
% ֱ��ͼ���⻯(�����)(Part 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��Ŀ���ɫͼƬ����ֱ��ͼ���⻯
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
