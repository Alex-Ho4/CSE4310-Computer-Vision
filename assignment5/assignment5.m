restoredefaultpath;
clear all;
close all;

addpath assignment5
addpath assignment5/face_detection
addpath assignment5/face_detection/images

%% Task 1 / 2
    
% scales = make_scales_array(1, 5, 1.1);
% iou_thr = 0.5;
% 
% template = imread('average_face.png');
% template_crop = imread('average_face_cropped.png');
% 
% uncrop = zeros(5,3);
% cropped = zeros(5,3);
% 
% k = 1;

% SHORT TEST
% d_thr = 0.6;
% [uncrop(k,1), uncrop(k,2), uncrop(k,3)] = detection_accuracy('ground_truth.txt', ...
%                      template, scales, d_thr, iou_thr);

%LONG TEST
% for d_thr = 0.4:0.1:0.8
%     [uncrop(k,1), uncrop(k,2), uncrop(k,3)] = detection_accuracy('ground_truth.txt', ...
%                     template, scales, d_thr, iou_thr);
%                 
%     [cropped(k,1), cropped(k,2), cropped(k,3)] = detection_accuracy('ground_truth.txt', ...
%                     template_crop, scales, d_thr, iou_thr);
%                 
%     k = k + 1;
% end
% 
% uc_tpr = uncrop(:,1) ./ 65;
% uc_fpr = uncrop(:,2) ./ 39;
% uc_fnr = uncrop(:,3) ./ 65;
% 
% uct_tpr = mean(uc_tpr);
% uct_fpr = mean(uc_fpr);
% uct_fnr = mean(uc_fnr);
% 
% c_tpr = cropped(:,1) ./ 65;
% c_fpr = cropped(:,2) ./ 39;
% c_fnr = cropped(:,3) ./ 65;
% 
% ct_tpr = mean(c_tpr);
% ct_fpr = mean(c_fpr);
% ct_fnr = mean(c_fnr);

%% Task 3

corr1 = load('img1_wc1.txt');
corr2 = load('img1_wc2.txt');

c1 = perspective_calibration(corr1);
c2 = perspective_calibration(corr2);

%% Task 4

img2 = load('img2_c1c2.txt');

results = zeros(21, 3);
for i = 1:21
    result = estimate_3D_point(c1, c2, img2(i,1), img2(i,2), img2(i,3), img2(i,4));
    results(i,:) = result';
end

% SHORT: result = estimate_3D_point(c1, c2, 68, 87, 84, 46);

%% Task 5

result = pinhole_location(corr1);

