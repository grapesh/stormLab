% 20220825 :: s.vinogradov@binera.com
% Function converts latitude to ATCF formatted string.
function s = atcf_lat (lat)

hemi = 'N'; if lat<0, hemi = 'S'; end
s = [pad( num2str(10*abs( round(lat,1))) , 4, 'left'), hemi];
