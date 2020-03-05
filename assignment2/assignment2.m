restoredefaultpath;
clear all;
close all;

%% TASK 1

frame = imread('data\zebra_with_holes.gif');
holeless = remove_holes(frame);
figure(1);
imshow(frame, []);
figure(2);
imshow(holeless, []);

frame = imread('data\simple_with_holes.gif');
holeless = remove_holes(frame);
figure(1);
imshow(frame, []);
figure(2);
imshow(holeless, []);

%% TASK 2

soccer = imread('data\soccer_field4.jpg');
soccer_analysis(soccer);

%% TASK 3

ocean = imread('data\ocean2.jpg');
ocean_segmentation(ocean);