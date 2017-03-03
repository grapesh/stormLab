% 20151001 :: Sergey.Vinogradov@noaa.gov
% Use :: str = pad_with (num, L, pad)
% function creates a string of L length
% padded with leading 'pad' symbol
% e.g., num=23,    L=4, pad='.' --> '..23';
% e.g., num='23W', L=4, pad=' ' --> ' 23W';
% 
function str = pad_with (num, L, pad)

if ~ischar(num)
    num = num2str(num);
end
strL = length(num);

if L<strL, L = strL; end;  % does not break 

for n=1:L-strL, str(n) = pad; end;

c = 0;
for n=L-strL+1:L
    c = c+1; str(n) = num(c);
end
end
