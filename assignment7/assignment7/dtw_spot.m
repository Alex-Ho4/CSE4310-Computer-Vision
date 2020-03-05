function result = dtw_spot(input_video, class_thresholds)

    function result = dist(p1, p2)
        % Return Euclidean Distance
        result = sqrt( (p1(1) - p2(1))^2 + (p1(2) - p2(2))^2 );
    end

result = [];

test_frames = read_video_frames(input_video);    
test_end = size(test_frames, 4);
test = green_hand_trajectory(input_video, 2, test_end-1);

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

for ind = 1:10
    st = quan_frames(ind,1);
    ed = quan_frames(ind,2);
    
    train = green_hand_trajectory( ...
                        'gesture_videos/digits_model_quan_ex3.avi',st,ed);
                    
    % Setup Dynamic Time Warping
    m = size(train, 1);
    n = size(test, 1);
    
    scores = zeros(m+1,n+1);
    scores(:,1) = inf;
    
    % DTW Main loop
    % i+1 = index i, i = 1: sink state
    for i = 1:m
        for j = 1:n
            cost = dist(train(i, :), test(j, :));
            prev = min([scores(i-1+1,j+1),scores(i+1,j-1+1), ...
                        scores(i-1+1,j-1+1)]);
            scores(i+1,j+1) = cost + prev;
        end
    end
    
    % Find lowest score and continue if above threshold
    lowest = min(scores(m+1, :));    
    if(lowest > class_thresholds(ind))
        continue;
    end
    
    % Calculate end frame
    [~, ends] = find(scores(m+1, :) == lowest);    
    
    % Find start frame and end frame with smallest path
    max_length = -1;
    
    start_frame = inf;
    end_frame = inf;
    
    for currEnd = ends
        length = 0;
        i = m+1;
        j = currEnd;
        
        while i > 2
            prev = min([scores(i-1,j),scores(i,j-1), ...
                            scores(i-1,j-1)]);

            if scores(i-1,j) == prev
                i = i-1;
            elseif scores(i-1,j-1) == prev
                i = i-1;
                j = j-1;
            else
                j = j-1;
            end         
        end
        
        % Find the amount of nodes traveled in the testing data
        length = currEnd - j;
        
        if length > max_length
            max_length = length;
            start_frame = j;
            end_frame = currEnd;
        end
    end
    
    % Add frame to final list    
    result = [result; start_frame(:), end_frame(:), ...
                                 mod(ones(size(start_frame,2),1)*ind, 10)];
    
end

end

