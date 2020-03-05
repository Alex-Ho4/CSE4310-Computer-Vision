function [scores, max_scales] = ssd_bn_multiscale(grayscale, template, scales)

    grayscale = double(grayscale);
    template = double(template);
    
    scores = ones(size(grayscale)) * -10;
    max_scales = zeros(size(grayscale));
    
    for s = scales
        
        if(s >= 1)
            scaled_img = imresize(grayscale, 1/s, 'bilinear');
            scaled_scores = ssd_bn_search(scaled_img, template);
            scaled_scores = imresize(scaled_scores, size(grayscale), 'nearest');
        else
            scaled_tmp = resize_template(template, s);
            scaled_scores = ssd_bn_search(grayscale, scaled_tmp);
        end
        
        higher_maxes = (scaled_scores > scores);
        max_scales(higher_maxes) = s;
        scores(higher_maxes) = scaled_scores(higher_maxes);
        
    end
 
end