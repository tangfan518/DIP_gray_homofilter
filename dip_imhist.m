function dip_imhist(I)
%绘制直方图 
[m,n]=size(I); %m,n为图像的大小
GP=zeros(1,256);
for k=0:255     
     GP(k+1)=length(find(I==k))/(m*n);  %计算每级灰度出现的概率，将其存入GP   
                                        %返回满足某条件的值
end 
 
%三，直方图均衡化 
S1=zeros(1,256); 
for i=1:256
    for j=1:i 
          S1(i)=GP(j)+S1(i);%累计分布实现直方图均衡化
    end 
end 
S2=round((S1*256)+0.5); %round四舍五入,将Sk归到相近级的灰度 
for i=1:256 
    GPeq(i)=sum(GP(find(S2==i)));%计算现有每个灰度级出现的概率 
end 
subplot(2,2,1);%subplot是将多个图画到一个平面上的工具。
%             其中，m表示是图排成m行，n表示图排成n列，也就是整个figure中有n个图是排成一行的，一共m行，如果m=2就是表示2行图。
%             p表示图所在的位置，p=1表示从左到右从上到下的第一个位置。
 
bar(0:255,GP,'b');  %bar(x,Y)：为Y中的每一个元素在指定的x位置绘制条形图。
%                              x是一个单调增加的向量，其用来定义垂直直方图中的x轴间距。
%                              如果Y是一个矩阵，bar对Y中的每行元素在指定x位置进行分组。
title('原图像直方图') 
 
subplot(2,2,2);
bar(0:255,GPeq,'b');  %b=blue
title('均衡化后的直方图'); 
 
X=I;
for i=0:255
    X(find(I==i)) = S2(i+1);
end
 
subplot(2,2,3);
imshow(I);
title('原图像') ;

subplot(2,2,4);
imshow(X);
title('直方图均衡后的图像');
end