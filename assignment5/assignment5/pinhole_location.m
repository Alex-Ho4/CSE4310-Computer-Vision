function result = pinhole_location(correspondences)

UV = [correspondences(1,4:5), 1]';
A = [correspondences(1,1:3), 1]';

f = -1/A(3);

C1 = [1, 0, 0, 0 ; ...
      0, 1, 0, 0 ; ...
      0, 0, -1/f, 0];
  
PA = C1 * A;

result = [-PA(1) + A(1) ; -PA(2) + A(2); -PA(3) + A(3)];

% PA = -A;

% XYZ = correspondences(1,1:3);
% UV = correspondences(1,4:5);

% HRT = perspective_calibration(correspondences);
% 
% UVW = HRT * A;
% 
% w = UVW(1) / UV(1);
% 

% 

% 
% C = -(- A)
%   
%PA = [(-A(1)/A(3) * f), (-A(2)/A(3) * f), 1];

% UVW(1) / w
% UVW(2) / w
% 
% C = UVW \ (A.*H);

% F1 = UV(1) / (-XYZ(1)/XYZ(3));
% F2 = UV(2) / (-XYZ(2)/XYZ(3));
% 
% (-XYZ(1)/XYZ(3)) * F1
% (-XYZ(2)/XYZ(3)) * F2
% 
% PA = [(-XYZ(1)/XYZ(3)) ; (-XYZ(2)/XYZ(3))];

% A = [XYZ , ones(size(XYZ, 1), 1)]';
% 
% C = PA / XYZ;
% 
% F = C .* XYZ;

end

