%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ͼ����ʵ��һ
% �ż��� 15031204 150324��
% Ϊͼ����Ӳ�ͬ��������Խ��������ֱ�����ֵ�˲��;�ֵ�˲�ȥ��(����һ)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
image_name='lena.bmp';%ͼ������
img=imread(image_name);% ��ȡͼ��
image_gauss=imnoise(img,'gaussian',0.02); %��Ӹ�˹����
salt_pepper_noise=imnoise(img,'salt & pepper',0.05); %��ӽ�������
salt_noise = im2uint8(randn(size(img)).*0.1); %���������������ת��Ϊunit8��
image_impulse=img+salt_noise;  %�����������
image_filter1=filter2(fspecial('average',3),salt_pepper_noise)/255;%��ֵ�˲�������������������0,1����Χ��
image_filter2 = medfilt2(salt_pepper_noise, [3 3]); %��ֵ�˲�
subplot(2,3,1); imshow(image_gauss); title('��˹����');%��ͼ����ʾ
subplot(2,3,2); imshow(salt_pepper_noise); title('��������');
subplot(2,3,3); imshow(image_impulse); title('��������');
subplot(2,3,4);imshow(img); title('ԭͼ');
subplot(2,3,5);imshow(image_filter1); title('����������ֵ�˲�');
subplot(2,3,6); imshow(image_filter2); title('����������ֵ�˲�');




