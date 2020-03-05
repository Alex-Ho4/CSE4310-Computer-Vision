function class_label = nnc_chamfer(test_image)
    
    min_dist = sum(sum(ones(size(test_image))));
    
    for i = 0:9
        for j = 1:15
            trainer = sprintf('digits_training\\label%i_training%i.png', i, j);
            dist = chamfer_distance(test_image, imread(trainer));
            if dist < min_dist
                class_label = i;
                min_dist = dist;
            end            
        end
    end

end