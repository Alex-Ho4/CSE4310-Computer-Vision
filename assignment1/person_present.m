function is_present = person_present(filename)

    [sequence_name, frame] = parse_frame_name(filename);
    filename0 = make_frame_name(sequence_name, 0);
    
    frame0 = read_gray(filename0);
    inputframe = read_gray(filename);
    
    kernel = fspecial('gaussian', 6 * ceil(5.0) + 1, 5.0);
    blurred_frame0 = imfilter(frame0, kernel);
    blurred_inputframe = imfilter(inputframe, kernel);
    diff = abs(blurred_frame0 - blurred_inputframe);
    
    threshold = 30; 
    thresholded = (diff > threshold);    
    
    thresholded = bwareafilt(thresholded, 2);
    
    [row, col] = find(thresholded);
    numel([row, col]);
    
    if numel([row, col]) >= 1500
        is_present = 1;
    else
        is_present = 0;
    end
    
end

