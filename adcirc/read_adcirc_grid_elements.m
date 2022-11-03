function [ myEl ] = read_adcirc_grid_elements (gridFile)
%read_adcirc_grid_elements :: reads grid elements from ADCIRC mesh file (fort.14) 
%                    returns a structure myEl with fields:
%                    je(NE), nm(NE,3)
%
% 20151030 Sergey.Vinogradov@noaa.gov

if ~exist (gridFile,'file')
    disp (['[ERROR]: File ', gridFile, ' does not exist.']);
    return
end

if ~exist ('strsplit')
    disp (['[ERROR]: You need to install a strsplit function,', ...
        ' or use MATLAB R2013 or higher.']);
    return
end
    
fid = fopen(gridFile, 'rt');
fgetl(fid);
str = str2double( strsplit( strtrim(fgetl(fid))) );
NE = str(1); NP = str(2);

disp (['[INFO]: Allocating memory for NE=', num2str(NE)]);
myEl.je = NaN.*ones(NE,1);
myEl.nm = NaN.*ones(NE,3);

disp ('[INFO]: Reading the nodes...');
for k=1:NP
    fgetl(fid);
end
disp ('[INFO]: Reading the elements...');

for k=1:NE
    str = str2double( strsplit(strtrim(fgetl(fid))) );
    myEl.je (k) = str(1);
    myEl.nm (k,1:3) = str(3:5);
end

fclose(fid);
end
