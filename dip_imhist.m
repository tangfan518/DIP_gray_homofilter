function dip_imhist(I)
%����ֱ��ͼ 
[m,n]=size(I); %m,nΪͼ��Ĵ�С
GP=zeros(1,256);
for k=0:255     
     GP(k+1)=length(find(I==k))/(m*n);  %����ÿ���Ҷȳ��ֵĸ��ʣ��������GP   
                                        %��������ĳ������ֵ
end 
 
%����ֱ��ͼ���⻯ 
S1=zeros(1,256); 
for i=1:256
    for j=1:i 
          S1(i)=GP(j)+S1(i);%�ۼƷֲ�ʵ��ֱ��ͼ���⻯
    end 
end 
S2=round((S1*256)+0.5); %round��������,��Sk�鵽������ĻҶ� 
for i=1:256 
    GPeq(i)=sum(GP(find(S2==i)));%��������ÿ���Ҷȼ����ֵĸ��� 
end 
subplot(2,2,1);%subplot�ǽ����ͼ����һ��ƽ���ϵĹ��ߡ�
%             ���У�m��ʾ��ͼ�ų�m�У�n��ʾͼ�ų�n�У�Ҳ��������figure����n��ͼ���ų�һ�еģ�һ��m�У����m=2���Ǳ�ʾ2��ͼ��
%             p��ʾͼ���ڵ�λ�ã�p=1��ʾ�����Ҵ��ϵ��µĵ�һ��λ�á�
 
bar(0:255,GP,'b');  %bar(x,Y)��ΪY�е�ÿһ��Ԫ����ָ����xλ�û�������ͼ��
%                              x��һ���������ӵ����������������崹ֱֱ��ͼ�е�x���ࡣ
%                              ���Y��һ������bar��Y�е�ÿ��Ԫ����ָ��xλ�ý��з��顣
title('ԭͼ��ֱ��ͼ') 
 
subplot(2,2,2);
bar(0:255,GPeq,'b');  %b=blue
title('���⻯���ֱ��ͼ'); 
 
X=I;
for i=0:255
    X(find(I==i)) = S2(i+1);
end
 
subplot(2,2,3);
imshow(I);
title('ԭͼ��') ;

subplot(2,2,4);
imshow(X);
title('ֱ��ͼ������ͼ��');
end