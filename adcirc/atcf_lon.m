% 20220825 :: s.vinogradov@binera.com
% Function converts longitude to ATCF formatted string.
function s = atcf_lon (lon)

hemi = 'E'; if lon<0, hemi = 'W'; end
s = [pad( num2str(10*abs( round(lon,1) )) , 5, 'left'), hemi];
