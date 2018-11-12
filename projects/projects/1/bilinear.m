function  dst = bilinear(src, row, col)
%BILINEAR bilinear interpolation
%
%   INPUT
%       SRC     source image
%       ROW,COL size of destination image
%   OUTPUT
%       DST     destination image

% get the size of source image
[m,n] = size(src);
% calculate row and column steps 
rstep = (m-1)/(row-1);
cstep = (n-1)/(col-1);
% initialize destination image
dst = zeros(row, col);
% in case of index out of range
src(m+1,:)=0;
src(:,n+1)=0;
% calculate destination image pixel by pixel
for i = 1:row
    for j = 1:col
        x = 1+rstep*(i-1);
        y = 1+cstep*(j-1);
        % fractional parts
        u = x-floor(x);
        v = y-floor(y);
        % integer parts
        x = floor(x);
        y = floor(y);
        dst(i,j) = (1-u)*(1-v)*src(x,y) +...
                   (1-u)*v*src(x,y+1) +...
                   u*(1-v)*src(x+1,y) +...
                   u*v*src(x+1,y+1);
    end
end
end

