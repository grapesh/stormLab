% 20160106 :: sergey.Vinogradov@noaa.gov
% BASIN,CY,YYYYMMDDHH,TECHNUM/MIN,TECH,TAU,LatN/S,LonE/W,VMAX,MSLP,TY,RAD,WINDCODE,RAD1,RAD2,RAD3,RAD4,RADP,RRP,MRD,GUSTS,EYE,SUBREGION,MAXSEAS,INITIALS,DIR,SPEED,STORMNAME,DEPTH,SEAS,SEASCODE,SEAS1,SEAS2,SEAS3,SEAS4,USERDEFINED,userdata

function atcf = read_atcf(atcf_file)

disp(['[INFO]: Reading ', atcf_file]);
fid = fopen(atcf_file, 'rt');
keepReading     = 1; 
n = 0;
while keepReading
    tline = fgetl(fid);
    if tline == -1
        keepReading = 0;
    else
        s = strsplit(tline,','); 
        n = n+1;
        atcf(n).basin = s{1};
        atcf(n).cy   = str2num(s{2});
        atcf(n).date = datenum(s{3},'YYYYmmDDhh');
        atcf(n).technum = s{4};
        atcf(n).tech    = s{5};        
        atcf(n).tau  = str2num(s{6});
        atcf(n).lat  = 0.1*adv_str2hemi(s{7});
        atcf(n).lon  = 0.1*adv_str2hemi(s{8});
        if atcf(n).lon < 0
           atcf(n).lon = 360+atcf(n).lon;
        end
        atcf(n).vmax = str2num(s{9});
        
        try atcf(n).mslp = str2num(s{10});      catch,  end            
        try atcf(n).ty       = s{11};           catch,  end
        try atcf(n).rad      = str2num(s{12});  catch,  end
        try atcf(n).windcode = s{13};           catch,  end
        try atcf(n).rad1     = str2num(s{14});  catch,  end
        try atcf(n).rad2     = str2num(s{15});  catch,  end
        try atcf(n).rad3     = str2num(s{16});  catch,  end
        try atcf(n).rad4     = str2num(s{17});  catch,  end
        try atcf(n).radp     = str2num(s{18});  catch,  end
        try atcf(n).rrp      = str2num(s{19});  catch,  end
        try atcf(n).mrd      = str2num(s{20});  catch,  end
        try atcf(n).gusts    = str2num(s{21});  catch,  end
        try atcf(n).eye      = str2num(s{22});  catch,  end
        try atcf(n).subregion= s{23};           catch,  end
        try atcf(n).maxseas  = str2num(s{24});  catch,  end
        try atcf(n).initials = s{25};           catch,  end
        try atcf(n).dir      = str2num(s{26});  catch,  end
        try atcf(n).speed    = str2num(s{27});  catch,  end
        try atcf(n).stormname= s{28};           catch,  end
        
        try atcf(n).depth    = str2num(s{29});  catch,  end
        try atcf(n).seas     = s{30};           catch,  end
        try atcf(n).seacode     = s{31};        catch,  end
        try atcf(n).seas1       = str2num(s{32});   catch,  end
        try atcf(n).seas2       = str2num(s{33});   catch,  end
        try atcf(n).seas3       = str2num(s{34});   catch,  end
        try atcf(n).seas4       = str2num(s{35});   catch,  end
        try atcf(n).userdefined = s{36};        catch,  end
        try atcf(n).userdata    = s{37};        catch,  end
        
            
    end
end
fclose(fid);
end