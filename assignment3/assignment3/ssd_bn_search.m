function result = ssd_bn_search(grayscale, template)

    grayscale = double(grayscale);
    template = double(template); 
    
    result = zeros(size(grayscale))-1;
    
    [rows, cols] = size(grayscale);
    [trows, tcols] = size(template);
    
    c_row = ceil(trows/2);
    c_col = ceil(tcols/2);
    
    template = template - mean(template(:));    
    templateV = template(:);
    
    for i = c_row:rows-c_row
        for j = c_col:cols-c_col
            cWindow = grayscale(i-c_row+1:i-c_row+trows,j-c_col+1:j-c_col+tcols);
            cWindow = cWindow - mean(cWindow(:));
            cWindowV = cWindow(:);
            
            diffV = cWindowV - templateV;
            squared_diffs = diffV .* diffV;
            ssd_score = sum(squared_diffs);
            result(i,j) = ssd_score;
        end
    end      
 
end