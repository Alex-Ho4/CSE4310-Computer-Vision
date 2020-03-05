function class_label = mei_classifier(filename, start_frame, end_frame)

test = mei_image(filename, start_frame, end_frame);

quan_frames = [143, 165;
               220, 300;
               350, 445;
               495, 544;
               608, 701;
               763, 850;
               906, 961;
               1035, 1150;
               1206, 1277;
               22, 91];
      
% train_mei = zeros(240,320,10);
% for i = 1:10
%     st = joni_frames(i,1);
%     ed = joni_frames(i,2);
%     
%     train_mei(:,:,i) = mei_image( ...
%         'gesture_videos/digits_model_joni_ex3.avi' ,st , ed);
% end
% 
% for i = 1:10
%     imshow(train_mei(:,:,i), []);
% end

min_dist = -1;
class_label = -1;

for i = 1:10
    st = quan_frames(i,1);
    ed = quan_frames(i,2);
    
    train = mei_image('gesture_videos/digits_model_quan_ex3.avi',st,ed);
    
    % Get Euclidean Distance
    im1 = double(test(:));
    im2 = double(train(:));  
    distance = sqrt(sum(abs(im1 - im2).^2));
    
    if min_dist == -1 || distance < min_dist
        min_dist = distance;
        class_label = i;        
    end
end

% 10 = class 0
class_label = mod(class_label, 10);

end