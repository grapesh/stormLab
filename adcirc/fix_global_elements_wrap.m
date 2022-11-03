 function newEl = fix_global_elements_wrap (myGrid, myEl)

newEl = myEl;

for n=1:length(myEl.je)
    longitudes = myGrid.x(myEl.nm(n,:));
    if range(longitudes) >= 300.
        newEl.nm(n,1:3) = NaN;
    end
end

