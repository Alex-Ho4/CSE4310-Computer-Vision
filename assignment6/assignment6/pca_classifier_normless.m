function class_label = pca_classifier(image, data_file, d, eigvecs, avgs)

% Normalize Image
image = double(image(:));

results = zeros(10, 1);

% If using normally, calculate eigenvectors and averages
if nargin == 3    
    eigvecs = zeros(28*28, d, 10);
    avgs = zeros(28, 28, 10);
    
    for i = 1:10        
        % 10 = Class 0
        class = mod(i,10);        
        [eigvecs(:,:,i), ~, avgs(:,:,i)] = mnist_pca(data_file, class, d);
    end    
end

for i = 1:10    
    proj = pca_projection(image, avgs(:,:,i), eigvecs(:,:,i));    
    backproj = pca_backprojection(proj, avgs(:,:,i), eigvecs(:,:,i));
    
%     % TEST SHOW
%         img = reshape(backproj, [28 28]);    
%         imshow(img, []);
%     %%%
    
    diff = backproj - image;
    results(i) = sum(diff .* diff);    
end

% Set class_label to index, where 10 = Class 0
[~, index] = min(results);
class_label = mod(index,10);

end

