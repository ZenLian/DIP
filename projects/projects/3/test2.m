clear; clc; close all;
f = imread('4.Fig4.30(a).jpg');
[M, N] = size(f);
figure; imshow(f,[]);
imwrite(f, 'images/2.source.jpg');
F = fftshift(fft2(f));

% butterworth highpass filter
H = 1-lpfilter('btw', M, N, 15, 2);
G = F .* H;
g = ifft2(fftshift(G));
figure; imshow(g, []);
imwrite(mat2gray(g), 'images/2.btw-hpfiltered-image.jpg');

% high-frequency emphasis
H_bfe = 0.5+2*H;
G = F .* H_bfe;
g = ifft2(fftshift(G));
figure; imshow(g, []);
imwrite(mat2gray(g), 'images/2.high-freq-emph-image.jpg');

% histogram equalization
g = histeq(mat2gray(g));
figure; imshow(g, []);
imwrite(mat2gray(g), 'images/2.result.jpg');