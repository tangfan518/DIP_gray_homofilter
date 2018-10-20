%灰度化处理有多种处理方式：分量法 最大法 平均法 加权平均法
%Matlab 中采用的是对R、G、B分量进行加权平均的算法：
%0.2989R+ 0.5870G + 0.1140B
function [imgray]=dip_rgb2gray(imrgb)
[m,n,t]=size(imrgb);   %m,n:图像的大小  t:彩色图像三原色
for i=1:m    
    for j=1:n                              
            imgray(i,j)=0.299*imrgb(i,j,1)+0.587*imrgb(i,j,2)+0.11400*imrgb(i,j,3);
            %加权实现从真彩到灰度的降维转换                   
    end
end