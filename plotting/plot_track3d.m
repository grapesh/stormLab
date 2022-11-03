% 20161007 :: Sergey.Vinogradov@noaa.gov
% plot_track3d (trk, z, <color, <linestyle>>)
% 
function plot_track3d (varargin)

col = 'r'; LineStyle = 'o-';

trk = varargin{1};
z = varargin{2};
if nargin >2
    col = varargin{3};
end
if nargin >3
    LineStyle = varargin{4};
end

%disp([col LineStyle]);
for n=1:length(trk)
    trklon(n) = trk(n).lon;
    trklat(n) = trk(n).lat;
    vmax(n)   = trk(n).vmax;
end
    
plot3(trklon, trklat, 0 + 0.*trklat, [0.5*[1 1 1] LineStyle],'LineWidth',1,'MarkerSize',6);
plot3(trklon, trklat, z.*vmax + 0.*trklat, [col LineStyle],'LineWidth',1,'MarkerSize',6);
for n=1:length(trk)
    plot3([trklon(n) trklon(n)], [trklat(n) trklat(n)], [0. z*vmax(n)], [0.5*[1 1 1] LineStyle],'LineWidth',1);
    text(trklon(n)+0.1, trklat(n), z*vmax(n), num2str(vmax(n)), 'Color','k','FontSize',8);
end
% for nn=1:length(trk)    
%     text(trk(nn).lon+0.03, trk(nn).lat+0.01, datestr(trk(nn).date,'mm/dd HHz'),'Color',col,'BackgroundColor','w','FontSize',8);
% end   

end