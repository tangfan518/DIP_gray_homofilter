%�ٶ��������ն�ͼ����лҶȻ���
%   ���㲢��ʾ���ϵ��ն�ͼ��ĻҶ�ֱ��ͼ����ɢ����Ҷ�任Ƶ�׷���ͼ
%�ڶ����ϵ��ն�ͼ��ֱ����ֱ��ͼ���⻯��̬ͬ�˲�������
%   ���������㷨������Ч�����жԱ�
%Ҫ�󣺺����㷨����ʵ�֣�����ע�Ͳ�����40%
%digital_image_processing

data=imread('C:\Users\dell\Desktop\1.jpg'); %��imread������ȡͼ��
imshow(data);%��ʾ��ȡ��ͼ��
gdata=dip_rgb2gray(data);%��rgb2gray������Ŀ��ͼ��ҶȻ�����gdata����洢�ҶȻ����ͼ����Ϣ
figure;
imshow(gdata);%��ʾ�ҶȻ����ͼ��
figure;
dip_imhist(gdata); %���㲢�����Ҷ�ֱ��ͼ���ۼƷֲ����⻯��ĻҶ�ֱ��ͼ
figure;
HomoFilter(gdata, 2, 0.25, 1, 5000);%̬ͬ�˲���������ɢ����Ҷ�任Ƶ�׷���ͼ