% 20150120 :: sergey.vinogradov@noaa.gov
% Reading adcirc maxwvel from the netcdf file
% Input: path to maxwvel.63.nc file
%
function [data, attrib] = read_adcirc_maxwvel_nc (ncFile)

data.time           = ncread(ncFile, 'time');
data.x              = ncread(ncFile, 'x');
data.y              = ncread(ncFile, 'y');
data.depth          = ncread(ncFile, 'depth');
data.wind_max       = ncread(ncFile, 'wind_max');

attrib.model        = ncreadatt(ncFile,'/','model');
attrib.version      = ncreadatt(ncFile,'/','version');
attrib.description  = ncreadatt(ncFile,'/','description');
attrib.agrid        = ncreadatt(ncFile,'/','agrid');
attrib.cdate        = ncreadatt(ncFile,'/','creation_date');
attrib.mdate        = ncreadatt(ncFile,'/','modification_date');

attrib.fort15.dt    = ncreadatt(ncFile,'/','dt');
attrib.fort15.ihot  = ncreadatt(ncFile,'/','ihot');
attrib.fort15.ics   = ncreadatt(ncFile,'/','ics');
attrib.fort15.nolibf   = ncreadatt(ncFile,'/','nolibf');
attrib.fort15.nolifa   = ncreadatt(ncFile,'/','nolifa');
attrib.fort15.nolica   = ncreadatt(ncFile,'/','nolica');
attrib.fort15.nolicat  = ncreadatt(ncFile,'/','nolicat');
attrib.fort15.nwp      = ncreadatt(ncFile,'/','nwp');
attrib.fort15.nws      = ncreadatt(ncFile,'/','nws');
attrib.fort15.nramp    = ncreadatt(ncFile,'/','nramp');
attrib.fort15.dramp    = ncreadatt(ncFile,'/','dramp');
attrib.fort15.rnday    = ncreadatt(ncFile,'/','rnday');
attrib.fort15.ncor     = ncreadatt(ncFile,'/','ncor');
attrib.fort15.ntip     = ncreadatt(ncFile,'/','ntip');
attrib.fort15.tau0     = ncreadatt(ncFile,'/','tau0');
attrib.fort15.statim   = ncreadatt(ncFile,'/','statim');
attrib.fort15.reftim   = ncreadatt(ncFile,'/','reftim');
attrib.fort15.a00      = ncreadatt(ncFile,'/','a00');
attrib.fort15.b00      = ncreadatt(ncFile,'/','b00');
attrib.fort15.c00      = ncreadatt(ncFile,'/','c00');
attrib.fort15.h0       = ncreadatt(ncFile,'/','h0');
attrib.fort15.slam0    = ncreadatt(ncFile,'/','slam0');
attrib.fort15.sfea0    = ncreadatt(ncFile,'/','sfea0');
attrib.fort15.cf       = ncreadatt(ncFile,'/','cf');
attrib.fort15.eslm     = ncreadatt(ncFile,'/','eslm');
attrib.fort15.cori     = ncreadatt(ncFile,'/','cori');
attrib.fort15.ntif     = ncreadatt(ncFile,'/','ntif');
attrib.fort15.nbfr     = ncreadatt(ncFile,'/','nbfr');

end
