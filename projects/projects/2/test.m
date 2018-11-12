clear;clc;close all;
img = imread('3.Fig3.46(a).jpg');
figure;imshow(img);title('source image');
imwrite(img, 'images/source.jpg');

lapmask = [ -1, -1, -1;...
            -1,  8, -1;...
            -1, -1, -1];
lapout = mat2gray(myfilter2(lapmask, img));
lapfinal = mat2gray(lapout+mat2gray(img));
figure;imshow(lapfinal);title('Laplacian enhanced');
imwrite(lapfinal, 'images/Laplacian enhanced.jpg');

sobelmask = [-1, -2, -1;...
              0,  0,  0;...
              1,  2,  1];
sobelout = mat2gray(abs(myfilter2(sobelmask, img)) + abs(myfilter2(sobelmask', img)));
figure;imshow(sobelout);title('Sobel gradient');
imwrite(sobelout, 'images/Sobel gradient.jpg');
smoothmask = ones(5)/25;
smoothout = mat2gray(myfilter2(smoothmask, sobelout));
figure;imshow(smoothout);title('Box filter smoothed');
imwrite(smoothout, 'images/Box filter smoothed.jpg');

finalmask = lapfinal .* smoothout;
figure;imshow(finalmask);title('Sharpened');
imwrite(finalmask, 'images/Sharpened.jpg');

enhimg = mat2gray(finalmask+ mat2gray(img));
figure;imshow(enhimg);title('sharpen enhanced');
imwrite(enhimg, 'images/sharpen enhanced.jpg');

final = mat2gray(enhimg.^0.5);
figure;imshow(final);title('final result');
imwrite(final, 'images/final.jpg');