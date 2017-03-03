% svinogra@aer.com, 
% adapted FORTRAN code from Davis Salstein
%
% function [slope, D] = trend(y)
% returns slope = trend,
% D - detrended time series
function [slope, D] = trend(y)

if ~exist('y')
    disp('use as [slope, D] = trend(y)');
    return;
end

%svv y = squeeze(y);

x = 1:length(y);
oldx = x;   oldy = y;
clear x y;

c = 0;
%svv following performance profiler
NN = length(find(~isnan(oldy)));
x = NaN*ones(1,NN);
y = NaN*ones(1,NN);

for n=1:length(oldy)
    if ~isnan(oldy(n))
        c = c+1;
        x(c) = oldx(n); 
        y(c) = oldy(n);
    end
end
N = c;
if N<2
    slope = NaN;
    D = oldy;
    return;
end

Sx = 0.;    Sxx = 0.;   
Sy = 0.;    Sxy = 0.;

for n=1:N
    Sx = Sx + x(n);
    Sxx= Sxx+ x(n)*x(n);
    Sy = Sy + y(n);
    Sxy= Sxy+ x(n)*y(n);        
end

const = N*Sxx-Sx^2;
slope = (N*Sxy-Sx*Sy)/const;
b = (Sxx*Sy-Sxy*Sx)/const;

b2 = Sy/N-slope*Sx/N;

[ix,foo]=size(oldx);
[iy,foo]=size(oldy);
if ix ~= iy
    oldy = oldy';
end
% if (size(oldy)~=size(oldx))
%     oldy = oldy';
% end
D = oldy-slope*oldx-b2;