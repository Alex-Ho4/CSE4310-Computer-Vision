function output = remove_holes(input)

    % create binary image
    binary = (input > 0);

    % get the value of the pixel at 1,1
    background = binary(1,1);

    
    if background == 1 
        % if 1,1 is white, fill entire image with white
        binary = ones(size(binary));

    else
        % if 1,1 is black, set the label as the background make everything
        % except the background white
        conn = bwlabel(~binary, 4);
        bg_index = conn(1,1);
        binary = (conn ~= bg_index);
    end
    
    % convert result to uint8
    output = binary * 255;
    output = cast(output,'uint8');
    
end

