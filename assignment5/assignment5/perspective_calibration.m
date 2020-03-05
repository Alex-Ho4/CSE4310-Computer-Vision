function camera_matrix = perspective_calibration(correspondences)

zero = zeros(size(correspondences,1),4);
one = ones(size(correspondences,1),1);

A1 = [correspondences(:, 1:3), one, zero ... 
     -(correspondences(:, 1:3).*correspondences(:, 4))];

A2 = [zero, correspondences(:, 1:3), one ... 
     -(correspondences(:, 1:3).*correspondences(:, 5))];
 
A = reshape(([A1 A2])',11,[])';

B = reshape(correspondences(:,4:5)',[],1);

x = A \ B;
x = [x; 1];

camera_matrix = reshape(x,4,[])';