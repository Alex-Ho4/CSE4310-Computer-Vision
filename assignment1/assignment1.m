restoredefaultpath;
clear all;
close all;

%addpath walkstraight utility_code;

% ========================
% find_bounding_box() test
% ========================

for n = 0:124
    string = sprintf('walkstraight\\frame%.4i.tif', n);
    [tr, br, lc, rc] = find_bounding_box(string);
end

%[tr, br, lc, rc] = find_bounding_box('walkstraight\frame0062.tif');

% =====================
% person_present() test
% =====================

% arr = [];
% for n = 0:124
%        string = sprintf('walkstraight\\frame%.4i.tif', n);
%        arr = [arr, person_present(string)];
% end

%person_present('walkstraight\frame0003.tif')
%person_present('walkstraight\frame0020.tif');

% [tr1, br1, lc1, rc1] = find_bounding_box('walkstraight\frame0062.tif');
% tt = imread('walkstraight\frame0062.tif', 'tif');
% centroid1 = [mean(tr1:br1), mean(lc1:rc1)];
% 
% tt = draw_rectangle(tt, [255,255,0], centroid1(1) - 5, ...
%                                      centroid1(1) + 5, ...
%                                      centroid1(2) - 5, ...
%                                      centroid1(2) + 5);
% imshow(tt);

% ===================
% person_speed() test
% ===================


% [r, c] = person_speed('walkstraight\frame0033.tif', 'walkstraight\frame0093.tif')
%[r, c] = person_speed('walkstraight\frame0062.tif', 'walkstraight\frame0032.tif')

% 
% frame0 = read_gray('walkstraight\frame0000.tif');
% inputframe = read_gray('walkstraight\frame0062.tif');
%     
% kernel = fspecial('gaussian', 6 * ceil(5.0) + 1, 5.0);
% blurred_frame0 = imfilter(frame0, kernel);
% blurred_inputframe = imfilter(inputframe, kernel);
% diff = abs(blurred_frame0 - blurred_inputframe);
%     
% threshold = 30; 
% thresholded = (diff > threshold);    
%     
% thresholded = bwareafilt(thresholded, 2);
%     
% [row, col] = find(thresholded);
% numel([row, col]);