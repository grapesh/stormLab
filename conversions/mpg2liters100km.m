% 20160804 :: grapesh@gmail.com
% Notorious formula for Eastern Europeans
% curious about fuel consumption.
% mpg --> liters/100km
% 
function out = mpg2liters100km (in)

out = 0;
if in ~= 0   
  out = sm2km(in)/gal2liters(1); % km/liter
  out = 100/out;  % liters / 100 km
end

end
