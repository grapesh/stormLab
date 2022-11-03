% 20150915 :: Sergey.Vinogradov@noaa.gov
% Takes a string for lat or lon (e.g. 30.1N, 44.9W)
% and converts to Easting/Northing coordinates
function coord = adv_str2hemi( str )

coord = str(1:end-1);

hemi = str(end);
lsign =-1;
if hemi=='N' | hemi=='E'
    lsign = 1; 
end
coord = lsign* str2double(coord);

end

