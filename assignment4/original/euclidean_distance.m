function distance = euclidean_distance(image1, image2)
    
    i1v = double(image1(:));
    i2v = double(image2(:));
    
    distance = sqrt(sum(abs(i2v - i1v).^2));

end