clear; clc; close all;
f = imread('4.Fig4.18(a).jpg');
[M, N] = size(f);
imtool(f, []);
imwrite(f, 'images/1.source.jpg');

F = fftshift(fft2(f));
%imtool(log(1+abs(F)), []);

H = lpfilter('gaussian', M, N, 15);
imtool(H, []);
imwrite(H, 'images/1.gaussian-lpfilter.jpg');

G = F .* H;
%imtool(log(1+abs(G)), []);

g = ifft2(fftshift(G));
imtool(g, []);
g = mat2gray(g);
imwrite(g, 'images/1.filtered-image.jpg');