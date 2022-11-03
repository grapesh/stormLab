% 20201008 :: s.vinogradov@nbinera.com
% Reading adcirc time series from the ascii file
% Input: path to fort.61 file
%
function data = read_adcirc_fort61 (fort61file)

fid = fopen(fort61file,'rt');
expDescr = fgetl(fid);
lin  = fgetl(fid);    info = split(lin);
NTRSPE       = str2num(info{2});
NTSTAE       = str2num(info{3});
DTDPxNSPOOLE = str2num(info{4});
NSPOOLE      = str2num(info{5});
IRTYPE       = str2num(info{6});
clear info;

for t=1:NTRSPE    
    lin = fgetl(fid);  
    info = split(lin);    
    TIME(t) = str2num(info{2});
    IT(t)   = str2num(info{3});

    for k=1:NTSTAE
        clear info;
        lin = fgetl(fid);  
        info = split(lin);
        data(k,t) = str2num(info{3});
    end
end
fclose(fid);
