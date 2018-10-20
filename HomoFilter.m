%̬ͬ�˲� Homomorphic filtering
function [image_out] = HomoFilter(image_in, rh, rl, c, D0)
% ����Ϊ��Ҫ�����˲��ĻҶ�ͼ��image_in��̬ͬ�˲����Ĳ���rh, rl,c, D0
%      ѡ��rh > 1, rl < 1���Դﵽ˥����Ƶ����ǿ��Ƶ��Ŀ�ģ�����c���ƺ����¶ȵ�������
%      D0��ֹƵ�ʣ�D0Խ�󣬶�ϸ�ڵ���ǿԽ���ԣ�����һ��֮����ʾ��ͼ��Խ����
% ���Ϊ�����˲�֮��ĻҶ�ͼ��image_out
[m, n] = size(image_in);
P = 2*m;
Q = 2*n;
 
% ȡ����
image1 = log(double(image_in) + 1);%(0~255)+1
 
fp = zeros(P, Q);
%��ͼ�����0,���ҳ���(-1)^(x+y) ���Ƶ��任����
for i = 1 : m
    for j = 1 : n
        fp(i, j) = double(image1(i, j)) * (-1)^(i+j);
    end
end
% �������ͼ����и���Ҷ�任
F1 = fft2(fp);  %���к��� ��fft2���ٵý��   ��С��������Լ�д��dtf��������������
margin=log(abs(F1));
subplot(1,3,1), imshow(margin), title('������');
% ����̬ͬ�˲�������������(m+1,n+1)
Homo = zeros(P, Q);
a = D0^2; % ����һЩ������м����
r = rh-rl;
for u = 1 : P
    for v = 1 : Q
        temp = (u-(m+1.0))^2 + (v-(n+1.0))^2;
        Homo(u, v) = r * (1-exp((-c)*(temp/a))) + rl;
    end
end
 
%�����˲�
G = F1 .* Homo;

% ������Ҷ�任
gp =ifft2(G);  %���к��� ��ifft���ٵý��   ��С��������Լ�д��idtf��������������
 
% ����õ���ͼ��
image_out = zeros(m, n, 'uint8');
gp = real(gp);
g = zeros(m, n);
for i = 1 : m
    for j = 1 : n
        g(i, j) = gp(i, j) * (-1)^(i+j);        
    end
end
% ָ������
ge = exp(g)-1;%ȡ����ʱ+1��ָ������-1
% ��һ����[0, L-1]
mmax = max(ge(:));
mmin = min(ge(:));
range = mmax-mmin;
for i = 1 : m
    for j = 1 : n
        image_out(i,j) = uint8(255 * (ge(i, j)-mmin) / range);
    end
end
subplot(1,3,2), imshow(image1), title('�Ҷ�ͼȡ����');
subplot(1,3,3), imshow(image_out), title('D0 = 5000');
end