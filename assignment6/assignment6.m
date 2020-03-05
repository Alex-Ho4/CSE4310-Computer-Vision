restoredefaultpath;
clear all;
close all;

addpath assignment6
addpath mnist

%% Task 1

% load_mnist

% digits = mnist_digits(:,:,mnist_labels == 2);
% d_labels = mnist_labels(mnist_labels == 2);
% 
% randInd = ceil(rand()*size(digits,3));
% var = digits(:,:, randInd);
% 
% imshow(var,[]);
% disp(d_labels(randInd));

% [eigvec, eigval] = mnist_pca('scrambled_mnist10000.bin', 7, 4);
% [eigvec1, eigval1, test] = mnist_pca('scrambled_mnist10000.bin', 7, 4);
% 
% test = eigvec(:,1);
% test = reshape(test, [28, 28]);
% imshow(test, []);


%% Task 2

% i = 5;

% load_mnist
% test = mnist_digits(:,:,i);
% label = mnist_labels(i);% imshow(test, []);

% test = imread(sprintf('digits_test/label%i_test1.png', i));
% label = i;
% 
% class_label = pca_classifier(test, 'scrambled_mnist10000.bin', 100);
% disp(label);
% disp(class_label);

%% Task 3 & 4

[accuracy1, confusion_matrix1] = pca_classifier_stats('scrambled_mnist10000.bin', 200);
%[accuracy2, confusion_matrix2] = pca_classifier_stats_normless('scrambled_mnist10000.bin', 5);

% result = zeros(10, 1);
% for i = 1:10
%     test = sprintf('digits_test/label%i_test%i.png', 0, i);
%     result(i,:) = pca_classifier(imread(test), 'scrambled_mnist10000.bin', 10);
% end

% test = imread('digits_test/label3_test4.png');
% class_label = pca_classifier(test, 'scrambled_mnist10000.bin', 10);

% d_val = 10:10:300;
% 
% accuracy = zeros(numel(d_val),1);
% confusion_matrix = zeros(10, 10, numel(d_val));
% 
% for i = 1:numel(d_val)
%     [accuracy(i), confusion_matrix(:,:,i)] = ...
%         pca_classifier_stats('scrambled_mnist60000.bin', d_val(i));
% end
% 
% hold on 
% bar(d_val,accuracy)
% title('Accuracy vs Values of d')
% xlabel('Values of d')
% ylabel('Accuracy')
% ylim([.9 1])
% xticks(0:10:300)
% hold off

%% Task 5 & Task6

% edge_image = imread('roofs1TEST.png');
% edge_image = edge_image(:,:,1);
% imshow(edge_image, []);

% edge_image = imread('roofs1.png');

% result1 = shape_context_feature(edge_image, 291, 198, 3);
% result2 = shape_context_feature(edge_image, 291, 198, 3);

% result1 = [22,55,0,42];
% result2 = [11,50,5,84];

% test = chi_squared(result1, result2)

%% Task 7

% gray = double(imread('hog1.jpg'));
% gray = (gray(:,:,1) + gray(:,:,2) + gray(:,:,3))./3;

% gray1 = read_gray('hogs1.png');
% gray2 = read_gray('hogs2.png');
% 
% test1 = hog_feature(gray1, 349, 588, 100);
% test2 = hog_feature(gray2, 515, 5, 100);
% 
% chi_squared(test1, test2)
