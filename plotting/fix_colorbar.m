% 20150929 :: Sergey.Vinogradov
% Function fixes the colorbar ticks whenever google_plot_map 
% or any other function messes the range

function h = fix_colorbar (h, cTicks)

limits = get(h,'Limits');

K = (cTicks(end) - cTicks(1))/(limits(end)-limits(1));
B = cTicks(1) - K*limits(1);

newTicks = (cTicks-B)/K;
set(h,'YTick',newTicks,'YTickLabel',cTicks);
