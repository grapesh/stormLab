% 20150915 :: Sergey.Vinogradov@noaa.gov
% Takes an easting/northing coordinate for lat or lon (e.g. -30.1, 44.9)
% and converts to string like 30.1E 44.9N
function str = adv_hemi2str( coord, latlon )

if ...
        ~isempty(strfind (latlon, 'lat')) | ...
        ~isempty(strfind (latlon, 'Lat')) | ...
        ~isempty(strfind (latlon, 'LAT'))
    if coord < 0, hemi = 'S'; else hemi = 'N'; end
end
if ...
        ~isempty(strfind (latlon, 'lon')) | ...
        ~isempty(strfind (latlon, 'Lon')) | ...
        ~isempty(strfind (latlon, 'LON'))
    if coord < 0, hemi = 'W'; else hemi = 'E'; end
end
str = [num2str( abs(coord)) hemi];

end
