function [accuracy, confusion_matrix] = pca_classifier_stats(data_file, d)

accuracy = 0;
confusion_matrix = zeros(10);

eigvecs = zeros(28*28, d, 10);
avgs = zeros(28, 28, 10);

% Get all eigenvectors and averages given d
for i = 1:10
    class = mod(i,10);
    [eigvecs(:,:,i),~,avgs(:,:,i)] = mnist_pca(data_file, class, d);       
end

for i = 1:10
    for j = 1:10
        
        class = mod(i,10);
        
        test = sprintf('digits_test/label%i_test%i.png', class, j);
        result = pca_classifier(imread(test), data_file, d, ...
                                eigvecs, avgs);
        
        if result == class
            accuracy = accuracy + 1;
        end
        
        if result == 0
            result = 10;
        end
        
        confusion_matrix(i, result) = confusion_matrix(i, result) + 1/10;
        
    end
end

accuracy = accuracy / 100;

end