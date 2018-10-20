%①对上述低照度图像进行灰度化，
%   计算并显示以上低照度图像的灰度直方图和离散傅里叶变换频谱幅度图
%②对以上低照度图像分别进行直方图均衡化和同态滤波操作，
%   并对两种算法的最终效果进行对比
%要求：核心算法独立实现，代码注释不少于40%
%digital_image_processing

data=imread('C:\Users\dell\Desktop\1.jpg'); %用imread函数读取图像
imshow(data);%显示读取的图像
gdata=dip_rgb2gray(data);%用rgb2gray函数将目标图像灰度化，用gdata矩阵存储灰度化后的图像信息
figure;
imshow(gdata);%显示灰度化后的图像
figure;
dip_imhist(gdata); %计算并画出灰度直方图和累计分布均衡化后的灰度直方图
figure;
HomoFilter(gdata, 2, 0.25, 1, 5000);%同态滤波并画出离散傅里叶变换频谱幅度图