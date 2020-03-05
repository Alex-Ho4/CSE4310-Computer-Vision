function result = shape_context_feature(edge_image, row, col, r1)

result = zeros(5, 12);
edge_image = edge_image > 0;

radii = (2.^([0:5]) * r1)/2;
radii(1) = 0;
bins = 0:(360/12):360;

[edgeY, edgeX] = find(edge_image > 0);
edgeX = edgeX - col;
edgeY = edgeY - row;

% Convert points to polar
[thetas, rhos] = cart2pol(edgeX, edgeY);
[rhos, indices] = sort(rhos);
thetas = radtodeg(thetas(indices));
thetas(thetas < 0) = 360 + thetas(thetas < 0);

rhos = rhos(rhos <= radii(5));
thetas = thetas(1:numel(rhos));

for b = 2:numel(bins)
    bin = find(thetas >= bins(b-1) & thetas < bins(b));
    rho_bin = rhos(bin);    
    count = zeros(5, 1);
    
    for r = 2:numel(radii)
        count(r-1) = numel(find(rho_bin >= radii(r-1) & rho_bin < radii(r)));
    end
    
    count(count == 0) = 1;    
    result(:,b-1) = count;
end

end

