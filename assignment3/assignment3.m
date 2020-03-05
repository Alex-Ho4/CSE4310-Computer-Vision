restoredefaultpath;
clear all;
close all;

addpath assignment3

%% TASK 1

% frame1 = read_gray('data\road8.jpg');
% 
% ths1 = 15;
% n = 1;
% 
% [hvotes thetas rhos] = hough(frame1);
% ohvotes = oriented_hough(frame1, thetas, rhos, ths1, 15);
% 
% figure(1);
% can = canny(double(frame1), ths1);
% imshow(can, []);
% 
% pause(n)
% 
% figure(2);
% h = hough_demo(double(frame1), ths1, 2, hvotes);
% imshow(h, []);
% 
% pause(n)
% 
% figure(3);
% oh = hough_demo(double(frame1), ths1, 2, ohvotes);
% imshow(oh, []);
% 
% pause(n)
% 
% figure(4);
% imshow(hvotes, []);
% 
% pause(n)
% 
% figure(5);
% imshow(votes, []);



%% TASK 2

% face = double(imread('data\picture1.png'));
% template = double(imread('data\template1.png'));
% 
% face = 1/3*face(:,:,1) + 1/3*face(:,:,2) + 1/3*face(:,:,3);
% template = 1/3*template(:,:,1) + 1/3*template(:,:,2) + 1/3*template(:,:,3);
% 
% scores = ssd_search(face, template);
% imshow(scores,[]);
% 
% scores(scores == -1) = max(scores(:));
% min_score = min(scores(:));
% 
% [rows, cols] = find(scores == min_score);
% y = rows(1);
% x = cols(1);
% [template_rows, template_cols] = size(template);
% face_rows = round(template_rows);
% face_cols = round(template_cols);
%  
% result = draw_rectangle2(face, y, x, face_rows, face_cols);
% imshow(result, [0 255]);

%% TASK 3

% face = double(imread('data\picture3.png'));
% template = double(imread('data\template1.png'));
% 
% face = 1/3*face(:,:,1) + 1/3*face(:,:,2) + 1/3*face(:,:,3);
% template = 1/3*template(:,:,1) + 1/3*template(:,:,2) + 1/3*template(:,:,3);
% 
% scores = ssd_bn_search(face, template);
% imshow(scores,[]);
% 
% scores(scores == -1) = max(scores(:));
% min_score = min(scores(:));
% 
% [rows, cols] = find(scores == min_score);
% y = rows(1);
% x = cols(1);
% [template_rows, template_cols] = size(template);
% face_rows = round(template_rows);
% face_cols = round(template_cols);
%  
% result = draw_rectangle2(face, y, x, face_rows, face_cols);
% imshow(result, [0 255]);

%% TASK 4

face = double(imread('data\picture2.png'));
template = double(imread('data\template1.png'));

face = 1/3*face(:,:,1) + 1/3*face(:,:,2) + 1/3*face(:,:,3);
template = 1/3*template(:,:,1) + 1/3*template(:,:,2) + 1/3*template(:,:,3);

scales = .23;

[scores, scales] = ssd_bn_multiscale(face, template, scales);

scores(scores == -1) = max(scores(:));
min_score = min(scores(:));

[rows, cols] = find(scores == min_score);
y = rows(1);
x = cols(1);
scale = scales(y, x);
[template_rows, template_cols] = size(template);
face_rows = round(template_rows * scale);
face_cols = round(template_cols * scale);
 
result = draw_rectangle2(face, y, x, face_rows, face_cols);
imshow(result, []);

