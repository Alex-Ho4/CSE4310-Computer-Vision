function class_label = dtw_classifier_green(filename, start_frame, end_frame)

    function result = dist(p1, p2)
        % Return Euclidean Distance
        result = sqrt( (p1(1) - p2(1))^2 + (p1(2) - p2(2))^2 );
    end

test = green_hand_trajectory(filename, start_frame, end_frame);

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
          
min_score = -1;

for ind = 1:10
    st = quan_frames(ind,1);
    ed = quan_frames(ind,2);
    
    train = green_hand_trajectory( ...
                        'gesture_videos/digits_model_quan_ex3.avi',st,ed);
                    
    % Setup Dynamic Time Warping
    m = size(train, 1);
    n = size(test, 1);
    
    scores = zeros(m, n);
    scores(1,1) = dist(train(1, :), test(1, :));
    
    for i = 2:m
        scores(i, 1) = scores(i-1, 1) + dist(train(i, :), test(1, :));
    end
    
    for j = 2:n
        scores(1, j) = scores(1, j-1) + dist(train(1, :), test(j, :));
    end
    
    % DTW Main loop (i,m: train, j,n: test)
    for i = 2:m
        for j = 2:n
            cost = dist(train(i, :), test(j, :));
            prev = min([scores(i-1,j),scores(i,j-1),scores(i-1,j-1)]);
            scores(i,j) = cost + prev;
        end
    end  
    
    final_score = scores(m, n);
    
    if final_score < min_score || min_score == -1
        min_score = final_score;
        class_label = ind;
    end
    
    % TESTING
%     figure(1);
%     imshow(mei_image('gesture_videos/digits_model_quan_ex3.avi', ...
%                     st, ed), []);
%     figure(2);
%     imshow(mei_image(filename, start_frame, end_frame), []);
    % =======
end

% 10 = class 0
class_label = mod(class_label, 10);

end