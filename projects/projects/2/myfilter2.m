function dst = myfilter2(mask, img)
%MYFILTER2 spacial filter
%   INPUT
%       MASK mask filter
%       IMG  source image
%   OUTPUT
%       DST result of image filtered by mask
img = double(img);
dst = img;
[M, N] = size(img);
[m, n] = size(mask);
a = (m-1)/2;
b = (n-1)/2;
for x = 1+a : M-a
    for y = 1+b : N-b
        dst(x,y) = 0;
        for s = -a : +a
            for t = -b : +b
                dst(x,y) = dst(x,y) + mask(s+a+1,t+b+1)*img(x+s,y+t);
            end
        end
    end
end
end

