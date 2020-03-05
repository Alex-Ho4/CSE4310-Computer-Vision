function result = pca_projection(vector, average, eigenvectors)

centered = vector(:) - average(:);
result = eigenvectors' * centered;
    
end