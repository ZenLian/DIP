clear;clc;close all;
img = imread('2.Fig2.19(a).jpg');
shrink = uint8(bilinear(img, 256, 256));
zoom = uint8(bilinear(shrink, 1024,1024));

imwrite(img,'images/source.jpg');
imshow(img);
title('source image');

imwrite(shrink,'images/shrink.jpg');
figure;
imshow(shrink);
title('shrink image');

imwrite(zoom,'images/zoom.jpg');
figure;
imshow(zoom);
title('zoom image');
