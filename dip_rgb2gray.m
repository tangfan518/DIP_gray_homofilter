%�ҶȻ������ж��ִ���ʽ�������� ��� ƽ���� ��Ȩƽ����
%Matlab �в��õ��Ƕ�R��G��B�������м�Ȩƽ�����㷨��
%0.2989R+ 0.5870G + 0.1140B
function [imgray]=dip_rgb2gray(imrgb)
[m,n,t]=size(imrgb);   %m,n:ͼ��Ĵ�С  t:��ɫͼ����ԭɫ
for i=1:m    
    for j=1:n                              
            imgray(i,j)=0.299*imrgb(i,j,1)+0.587*imrgb(i,j,2)+0.11400*imrgb(i,j,3);
            %��Ȩʵ�ִ���ʵ��ҶȵĽ�άת��                   
    end
end