function [toprow, bottomrow, leftcolumn, rightcolumn] = find_bounding_box(filename)

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
    
    toprow = min(row);
    bottomrow = max(row);
    leftcolumn = min(col);
    rightcolumn = max(col); 
    
    color_image = imread(filename, 'tif');

    color_image = draw_rectangle(color_image, [255,255,0], toprow, ...
                                 bottomrow, leftcolumn, rightcolumn);
    imshow(color_image);
    
end