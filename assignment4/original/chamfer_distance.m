function distance = chamfer_distance(image1, image2)

    im1b = (image1 ~= 0);
    im2b = (image2 ~= 0);
    
    n1 = sum(im1b(:));
    dist2 = double(bwdist(im2b));
    im1dist = im1b .* dist2;    
    chamfer1 = sum(im1dist(:)) / n1;
    
    n2 = sum(im2b(:));
    dist1 = double(bwdist(im1b));
    im2dist = im2b .* dist1;    
    chamfer2 = sum(im2dist(:)) / n2;
    
    distance = chamfer1 + chamfer2;
    
end

