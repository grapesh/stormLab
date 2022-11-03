% Sergey Vinogradov
%function plot_sparse_data_layer(x,y,vec,threshold,clim,sizes,shapes,edgecolor)
% TODO: sizing as a function of sparsity:
%       Precompute distance matrix
function cmap = plot_sparse_data_layer3d(x,y,vec,threshold, clim, sizes, shapes, edgecolor, cmap, offset)

if ~exist('x')
    disp('same as plot_sparse_data4 but for current axes');
    disp('Use as: plot_sparse_data_layer(x,y,vec,threshold, clim, sizes, shapes, edgecolor, cmap');
    disp('where ');
    disp('x,  y,  vec - your foreground field, vectors,');
    disp('threshold       - a scalar value for statistics, e.g. 0');
    disp('clim - array of min max values for coloring, e.g. [0 2]');
    disp('sizes- array of min max sizes for markers of data, e.g [6 6]');
    disp('shapes-data markers shapes, [shape_above_threshold shape_below_threshold]' );
    disp('edgecolor-data markers edgecolors');
    disp('cmap colormap, e.g. colormap(jet(64))');
    disp('');    
    return
end

freezeColors;

%define shapes
shape_default = 'o';    
if (isempty(shapes) | isnan(shapes))
    shape_up   = '^';       shape_down = 'v';
elseif length(shapes)==1
    shape_up   = shapes ;       
    shape_down = shapes;
elseif length(shapes)==2
    shape_up   = shapes(1) ;       
    shape_down = shapes(2);    
end

shape_bkg  = 'o';
bkg_size = 4;

%define ranges
N    = length(vec);       
cmax = nanmax(vec);    
cmin = nanmin(vec);    
avg  = nanmean(vec);   
% 
if length(clim)
    cmin = clim(1);
    cmax = clim(2);
end

%define 256-colors
ncol = length(cmap);
%cmap = colormap(jet(ncol));

% % load coastline
% coastfile = '/project/p1150/M-bench/lib/coastline_files/world.dat';
% if exist(coastfile)
%     coast =load(coastfile);
% end
% hold on
% plot(coast(:,1),coast(:,2),'Color',[0.7 0.7 0.7]);
% load ('cmap10.mat');
if length(sizes)
    min_size = sizes(1);   
    max_size = sizes(2);
else
    min_size = 7;   
    max_size = 7;
end

disp(strcat('][ plotting [',num2str(N),'] points in data layer, please wait...'));
[sorted, ix] = sort(vec,'descend');
%ix = 1:N;

above = 0;  below = 0;
hold on;
for i=1:N
    if ~isnan(x(i)*y(i)*vec(ix(i)))
        n=ix(i);
        if vec(n) < cmin, vec(n)=cmin; end
        if vec(n) > cmax, vec(n)=cmax; end

        a = (vec(n)-cmin)/(cmax-cmin);
        if ~isnan(a)
            pnt.marker = shape_default;
            col = floor(ncol*a)+1;
            if(col>ncol), col=ncol; end
            if(col<=0), col=1; end
            
            pnt.facecolor = [cmap(col,:)];
            if isnan(edgecolor)
                if col-5 <=0 
                    pnt.edgecolor = [cmap(col,:)];
                else
                    pnt.edgecolor = [cmap(col-5,:)]; %'k'
                end
                pnt.edgecolor = pnt.facecolor; %'none';
            else
                pnt.edgecolor = edgecolor;
            end
            
            pnt.size  = min_size + a*(max_size-min_size);
            if vec(n)>=threshold
                %pnt.size  = max_size;
                pnt.marker = shape_up;
                above = above + 1;
            else
                %pnt.size  = min_size;
                pnt.marker = shape_down;
                below = below + 1;
            end
            plot3(x(n),y(n),offset,...
                'Marker',pnt.marker,...
                'MarkerSize',pnt.size,...
                'MarkerEdgeColor',pnt.edgecolor,...
                'MarkerFaceColor',pnt.facecolor);
            hold on; 
            if mod(i,1000)==0
                disp (num2str(i/N*100));
            end
        end        
    end
end

if length(clim)
    caxis([clim(1) clim(2)]);
else
    caxis([cmin cmax]);
end
hold on