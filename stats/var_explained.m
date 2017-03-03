% svinogra@aer.com
% Function computes variance in data (d)
% that is explained in the model (m)
% d and m are same-size vectors
% 

function v = var_explained(d,m)
v = NaN;

%align
[icd,jcd] = size(d);
[icm,jcm] = size(m);

if icd==jcm && jcd == icm
    m = m';
end

ind1 = find(~isnan(d));
ind2 = find(~isnan(m));

count = 0;
for n=1:length(ind1)
    a = find(ind2==ind1(n));
    if length(a)
        count = count+1;
        newind(count) = ind2(a);
    end
end

if count
    d = d(newind);
    m = m(newind);

    if(var(d)==0)
        v = 0;
    else
        v = 100.*( var(d) - var(d-m) )/var(d);
    end
    if v <0, v = 0; end
end
