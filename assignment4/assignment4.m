restoredefaultpath;
clear all;
close all;

addpath assignment4
% addpath digits_test
% addpath digits_training

%% Task 1
    
image1 = imread('digits_test/label0_test1.png');
image2 = imread('digits_training/label1_training2.png');

task1_dist = euclidean_distance(image1,image2)

%% Task 2

test_image = imread(sprintf('digits_test/label1_test%i.png', ceil(rand(1)*10)));
task2_label = nnc_euclidean(test_image)

%% Task 3

[acc, cfm] = nnc_euclidean_stats();

%% Task 4 (EXAMPLE)

% G = [12,5; 8,6; 5,13];
% R = [5,7; 6,11];
% 
% min_dist = zeros(1,size(R,1));
% 
% for i = 1:size(R,1)
%     min = max(R(:));
%     for j = 1:size(G,1)
%         dist = euclidean_distance(R(i,:),G(j,:));
%         if dist < min
%             min = dist;
%         end
%     end
%     min_dist(i) = min;
% end
% 
% sum(min_dist(:)) / numel(min_dist)

%% Task 4

% image1 = zeros(20);
% image2 = zeros(20);
% 
% image1(12,5) = 1;
% image1(8,6) = 1;
% image1(5,13) = 1;
% 
% image2(5,7) = 1;
% image2(6,11) = 1;
% 
% chamfer_distance(image1, image2)

image1 = imread('digits_test/label0_test1.png');
image2 = imread('digits_training/label1_training2.png');

task4_dist = chamfer_distance(image1, image2);

%% Task 5

% task5_label = zeros(10,1);
% 
% for i = 1:10
%     test_image = imread(sprintf('digits_test/label4_test%i.png',i));
%     task5_label(i,1) = nnc_chamfer(test_image);
% end

% test_image = imread(sprintf('digits_test/label1_test%i.png', ceil(rand(1)*10)));

task5_label = nnc_chamfer(test_image)

%% Task 6

[cham_acc, cham_cfm] = nnc_chamfer_stats();