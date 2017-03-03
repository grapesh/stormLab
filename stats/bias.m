% 20151019 :: Sergey.Vinogradov@noaa.gov
% Function computes mean bias between obs and mod time series
% 
function b = bias (obs, mod)

if length(obs) ~= length(mod)
    disp('[ERROR]: bias.m - time series of different lengths. Exiting.');
    return;
end
b = nanmean (obs-mod);
end
