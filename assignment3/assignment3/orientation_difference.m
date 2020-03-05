function diff = orientation_difference(o, theta)

    o = mod(o, 360);
    theta = mod(theta, 360);
    
    if theta < 0
        theta = theta + 360;
    end
    
    if o < 0
        o = o + 360;
    end
    
    diff = abs(o - theta);
    
    if(diff > 180)
        diff = diff - 180;
    end
    
    if(diff > 90)
        diff = 180 - diff;
    end

end