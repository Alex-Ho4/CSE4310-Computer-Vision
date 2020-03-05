function [eigenvectors, eigenvalues, average] = mnist_pca(data_file, class_label, d)

%% Load data from file (from load_mnist.m)

fid = fopen(data_file, 'r');

[number, count] = fread(fid, 1, 'int32');
if count ~= 1
    disp('failed to read number');
end

[mnist_permutation, count] = fread(fid, number, 'int32');
if count ~= mnist_permutation
    disp('failed to read number');
end

[mnist_labels, count] = fread(fid, number, 'uchar');
if count ~= number
    disp('failed to read number');
end
    
mnist_digits = fread(fid, [28, 28 * number], 'uint8=>uint8');
mnist_digits = reshape(mnist_digits, [28, 28, number]);

fclose(fid);
%disp('loaded mnist digits');

%% Implement Task 1

% Get data matching class_label
digits = mnist_digits(:,:,(mnist_labels == class_label));
%labels = mnist_labels(mnist_labels == class_label);

% Vectorize data set
number = size(digits, 3);
dimensions = size(digits, 1) * size(digits, 2);

digit_vectors = zeros(dimensions, number);

for index = 1:number
    digit = digits(:, :, index);
    digit = double(digit(:));
    digit = (digit - mean(digit)) / std(digit);
    digit_vectors(:, index) = digit;
end

% Center vectors and get average
number = size(digit_vectors, 2);
average = [mean(digit_vectors')]';

centered_vectors = zeros(size(digit_vectors));
 
for index = 1:number
    centered_vectors(:, index) = digit_vectors(:, index) - average;
end

% Get eigenvalues / eigenvectors
covariance_matrix = centered_vectors * centered_vectors';
[eigenvectors, eigenvalues] = eig(covariance_matrix);
 
% eigenvalues is a matrix, but only the diagonal 
% matters, so we throw away the rest
eigenvalues = diag(eigenvalues);
[eigenvalues, indices] = sort(eigenvalues, 'descend');

eigenvalues = eigenvalues(1:d);
eigenvectors = eigenvectors(:, indices(1:d));
average = reshape(average, [28 28]);

end