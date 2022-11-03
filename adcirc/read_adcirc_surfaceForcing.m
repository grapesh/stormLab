% 20161004 :: Sergey.Vinogradov@noaa.gov
% 
function trk = read_adcirc_surfaceForcing( forcingFile )

% Forcing
atcf_trk = read_atcf(forcingFile);    
for nn=1:length(atcf_trk)
    trk.lon(nn)  = atcf_trk(nn).lon;
    trk.lat(nn)  = atcf_trk(nn).lat;
    trk.vmax(nn) = atcf_trk(nn).vmax;   
    trk.date(nn) = atcf_trk(nn).date;       
end

end
