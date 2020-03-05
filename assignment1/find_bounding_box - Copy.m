function [toprow, bottomrow, leftcolumn, rightcolumn] = find_bounding_box(filename)

    frame0 = read_gray('frame0000.tif');
    inputframe = read_gray(filename);

    diff = abs(frame0 - inputframe);
    
    kernel = fspecial('gaussian', 6 * ceil(3.0) + 1, 3.0);
    blurred_frame0 = imfilter(frame0, kernel);
    blurred_inputframe = imfilter(inputframe, kernel);
    diff = abs(blurred_frame0 - blurred_inputframe);
    
    threshold = 59; %84 
    thresholded = (diff > threshold);
    
    thresholded = imclose(thresholded, ones(3,3));
%     
%     figure(2)
%     imshow(thresholded, []);
%     figure(1)

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