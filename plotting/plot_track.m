% 20161007 :: Sergey.Vinogradov@noaa.gov
% 
function plot_track (trk)

plot(trk.lon, trk.lat,'o-k','LineWidth',2);
for nn=1:length(trk.lon)
    plot(trk.lon, trk.lat,'o-k');
    text(trk.lon(nn)+0.03, trk.lat(nn)+0.01, datestr(trk.date(nn),'mm/dd HHz'),'Color','k','BackgroundColor','w','FontSize',8);
end   

end