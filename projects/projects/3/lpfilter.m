function H = lpfilter(type,M,N,D0,n)
%LPFILTER  produce a lowpass filter whose zero-component
%          frequency is set to center of spectrum

% meshgrid for u, v
u=-floor(M/2):ceil(M/2-1);
v=-floor(N/2):ceil(N/2-1);
[V,U]=meshgrid(v,u);

% D represents for distance to center
D=sqrt(U.^2+V.^2);

% produce filter according to different type
switch type
    case 'ideal'
        H=double(D<=D0);
    case 'btw'
        if nargin ==4
            n=1;
        end
        H=1./(1+(D./D0).^(2*n));
    case 'gaussian'
        H=exp(-(D.^2)./(2*(D0^2)));
    otherwise
        error('unknown filter type')  
end        
end
