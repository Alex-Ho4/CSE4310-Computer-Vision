function result = pca_backprojection(projection, average, eigenvectors)

projection = projection(:);
centered_result = eigenvectors * projection;
result = centered_result + average(:);
        
end
