% 20221103 :: grapesh@gmail.com 
% Adopted from the 2022-11-02 script by Taylor Asher
% Reading adcirc tidal output from the ascii file
% Input: path to fort.53 file
%
function data = read_adcirc_fort53(fort61file)

try
    fid=fopen(fort61file,'rt');
    
    %Read header
    nfreq=cell2mat(textscan(fid,'%d\n',1));         %number of harmonics
%     for cnt1=1:nfreq
%         namefr(cnt1)=fscanf(fid,'%s\n',1);
%         tmp1=fscanf(fid,'%f %f %f %s\n',1)
%         HAFREQ(k), HAFF(k), HAFACE(k)
%     end
    tmp1=textscan(fid,'%f %f %f %s\n',nfreq);
    hafreq=cell2mat(tmp1(:,1));                     %harmonic frequencies (radians/second)
    haff=cell2mat(tmp1(:,2));                       %nodal factors (unitless)
    haface=cell2mat(tmp1(:,3));                     %equilibrium arguments (degrees)
    namefr=string(tmp1{:,4});                       %names of frequencies
    
    np=cell2mat(textscan(fid,'%d\n',1));            %number of points
   
    %Read body
    readfmt=['%d\n',repmat('%f %f\n',1,nfreq)];
    stride=2*nfreq+1;
    tmp1=fscanf(fid,readfmt,np*stride);
    p=tmp1(1:stride:end);
    emagt=nan(np,nfreq);                            %harmonic amplitude (meters)
    phasede=nan(np,nfreq);                          %harmonic phase (degrees)
    for cnt1=1:nfreq
        emagt(:,cnt1)=tmp1(2*(cnt1-1)+2:stride:end); 
        phasede(:,cnt1)=tmp1(2*(cnt1-1)+3:stride:end); 
    end
catch err
    if exist('fid','var')&&fid~=-1
        fclose(fid);
    end
    rethrow(err)
end
fclose(fid);

data.frequency    = hafreq;
data.nodal_factor = haff;
data.name         = namefr;
data.equilibrium  = haface;
data.amp          = emagt;
data.phs          = phasede;


