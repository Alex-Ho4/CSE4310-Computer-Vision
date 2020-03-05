function votes = oriented_hough(grayscale, thetas, rhos, thr1, thr2)

    d_frame = double(grayscale);
    frame = canny(d_frame,thr1);
    votes = zeros(numel(rhos), numel(thetas));
    
    [rows, cols] = find(frame);

    dx = [-1, 0, 1];
    dy = dx';
    
    dxA = imfilter(frame, dx, 'same', 'symmetric');
    dyA = imfilter(frame, dy, 'same', 'symmetric');

    gradient_thetas = gradient_orientations(dxA, dyA);
    
    for i = 1:numel(rows)        
        x = cols(i);
        y = rows(i);
        o = gradient_thetas(rows(i), cols(i));       
        for t = 1:numel(thetas)
            if orientation_difference(o, thetas(t)) <= thr2
                rho = x * cosd(thetas(t)) + y * sind(thetas(t));
                vrhos = find(rhos == rho);
                if isempty(vrhos)
                    difference = min(abs(rho - rhos));
                    vrhos = find(rhos == (rho + difference) | rhos == (rho - difference));                    
                end
                if numel(vrhos) > 1
                    split = 1 / numel(vrhos);
                    for k = 1:numel(vrhos)
                        votes(vrhos(k), t) = votes(vrhos(k), t) + split;
                    end
                else
                    votes(vrhos, t) = votes(vrhos, t) + 1;
                end                
            end
        end   
    end
    
end