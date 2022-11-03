 function [ myGrid ] = read_adcirc_grid (gridFile)
%read_adcirc_grid :: reads grid nodes from ADCIRC mesh file (fort.14) 
%                    returns a structure myGrid with fields:
%                    x(NP), y(NP), z(NP) for coords and depths
%                    Note: ADCIRC depths are positive.
%
% 20130920 by svinogra@stevens.edu

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
fline = strsplit( strtrim(fgetl(fid)));
str = str2double( fline );
NP = str(2);

disp (['[INFO]: Allocating memory for NP=', num2str(NP)]);
myGrid.x = NaN.*ones(NP,1);
myGrid.y = NaN.*ones(NP,1);
myGrid.z = NaN.*ones(NP,1);
disp ('[INFO]: Reading the grid...');

for k=1:NP
    str = str2double( strsplit(strtrim(fgetl(fid))) );
    myGrid.x (k)  = str(2);
    myGrid.y (k)  = str(3);
    myGrid.z (k)  = str(4);
end

fclose(fid);
end
