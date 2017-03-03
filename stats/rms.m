% function [r,count] = rms(xi)
%          ________
%         /1       2
% rms = \/ -- E(xi)
%          N
%
% Sergey Vinogradov, AER.Inc.

function [r,count] = rms(x)

summ = 0;
count = 0;
L = length(x);

for n=1:L
    mpx = x(n)^2;
    if ~isnan(mpx)
        summ = summ + mpx;
        count = count + 1;
    end
end

if count > 0
    r = sqrt(summ/count);
else
    r = NaN;
end
