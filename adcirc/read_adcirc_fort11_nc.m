% 20150120 :: sergey.vinogradov@noaa.gov
% Reading baroclinic pressure gradient from the netcdf file
% Input: path to fort.11.nc file
%
function data = read_adcirc_fort11_nc (ncFile)

disp(['[info]: reading baroclinic pressure gradient from ', ncFile]);

myTime              = ncread(ncFile, 'time');
[strlen, NT] = size(myTime);
for t=1:NT
    data.time(t) = datenum( myTime(1:strlen,t)');
end

data.x              = ncread(ncFile, 'lonc');
data.y              = ncread(ncFile, 'latc');
data.bpgx           = ncread(ncFile, 'BPGX');
data.bpgy           = ncread(ncFile, 'BPGY');

end
