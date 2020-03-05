function [toprow, bottomrow, leftcolumn, rightcolumn] = find_bounding_box(filename)
    %walkdata0 = imread('frame0000.tif', 'tif');
    %double_walk0 = (double(walkdata0)/255);
    %frame0 = (double_walk0(:,:,1) + double_walk0(:,:,2) + double_walk0(:,:,3) / 3);

    %walkdata = imread(filename, 'tif');
    %double_walk = (double(walkdata)/255);
    %inputframe = (double_walk(:,:,1) + double_walk(:,:,2) + double_walk(:,:,3) / 3);

    % figure(1)
    % imshow(frame0, [])
    % figure(2)
    % imshow(inputframe, [])
    % figure(3)
    
    frame0 = read_gray('frame0000.tif');
    inputframe = read_gray(filename);

    diff = abs(frame0 - inputframe);
    
    threshold = 100; 
    thresholded = (diff > threshold);
    
%     imshow(thresholded, []);
% 
%     rotated = rot90(thresholded);
%     
%     [temp, lc] = find(thresholded, 1);
%     [temp, rc] = find(thresholded, 1, 'last');
%     [temp, tr] = find(rotated, 1);
%     [temp, br] = find(rotated, 1, 'last');

%     toprow = tr;
%     bottomrow = br;
%     leftcolumn = lc;
%     rightcolumn = rc;

    [row, col] = find(thresholded);
    
    toprow = min(row);
    bottomrow = max(row);
    leftcolumn = min(col);
    rightcolumn = max(col); 
    
    color_image = imread(filename, 'tif');
    
%     color_image(tr, lc:rc, 1:2) = 255;
%     color_image(tr, lc:rc, 3) = 0;
%     
%     color_image(br, lc:rc, 1:2) = 255;
%     color_image(br, lc:rc, 3) = 0;
%     
%     color_image(tr:br, lc, 1:2) = 255;
%     color_image(tr:br, lc, 3) = 0;
%     
%     color_image(tr:br, rc, 1:2) = 255;
%     color_image(tr:br, rc, 3) = 0;

    color_image = draw_rectangle(color_image, [255,255,0], toprow, ...
                                 bottomrow, leftcolumn, rightcolumn);

    imshow(color_image);    
end