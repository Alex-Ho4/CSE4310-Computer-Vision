function result = hog_feature(image, top, left, block_size)

block = image(top:top+block_size-1 , left:left+block_size-1);
cells = zeros(4, 9);
bins = 0:180/9:180;

% Compute Orientation Histograms
cell_num = 1;
cSize = block_size/2;
for i = 0:1
    for j = 0:1
        cTop = top + (cSize * i);
        cLeft = left + (cSize * j);
        cell = image(cTop:cTop+cSize-1, cLeft:cLeft+cSize-1);

        grad_dy = imfilter(cell, [-1, 0, 1]');
        grad_dx = imfilter(cell, [-1, 0, 1]);
        
        grad_orient = atan2(grad_dy(:), grad_dx(:));        
        grad_orient = radtodeg(grad_orient);
        grad_orient(grad_orient < 0) = 180 + grad_orient(grad_orient < 0);
        
        grad_norms = (grad_dx.^2 + grad_dy.^2).^0.5;
        grad_norms = grad_norms(:);
        
        for b = 2:numel(bins)
            
            bin = find(grad_orient >= bins(b-1) & grad_orient < bins(b));
            bin_norms = grad_norms(bin);
            
            cells(cell_num, b-1) = sum(bin_norms);
        end
        
        cell_num = cell_num + 1;
    end
end

cells = cells(:);

cells = cells / norm(cells);
cells(cells > 0.2) = 0.2;
cells = cells / norm(cells);

result = cells;

end

