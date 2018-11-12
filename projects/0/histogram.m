function [grayLevel,p] = histogram(img)
%HISTOGRAM 显示图像直方图
%   此处显示详细说明
grayLevel = uint8(0:255);
p = zeros(1,256);
for x = img
    p(x+1) = p(x+1)+1;
end
[m,n] = size(img);
N = m*n;
p = p ./ N;
bar(grayLevel, p);

end

