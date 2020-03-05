restoredefaultpath;
clear all;
close all;

addpath assignment7

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
           
joni_frames = [183, 212;
              270, 338;
              399, 467;
              532, 578;
              650, 738;
              789, 857;
              915, 964;
              1022, 1137;
              1200, 1277;
              47, 105];

%% Task 1

% test = mei_image('gesture_videos/digits_model_joni_ex3.avi', 270, 338);
% test2 = mei_image('gesture_videos/digits_model_quan_ex3.avi', 220, 300);

%% Task 2

% for i = 1:10
% class = i;
% test_class = mei_classifier('gesture_videos/digits_model_joni_ex3.avi',...
%                             joni_frames(class, 1), joni_frames(class, 2))
% end

%% Task 3

% traj = green_hand_trajectory('gesture_videos/digits_model_joni_ex3.avi',270,338);
                                                             
%% Task 4

% q_classes = zeros(10, 1);
% 
% for i = 1:10
%     st = joni_frames(i, 1);
%     ed = joni_frames(i, 2);
% 
%     q_classes(i) = dtw_classifier_green( ...
%                            'gesture_videos/digits_model_joni_ex3.avi',...
%                            st, ed)
% end

% st = joni_frames(2, 1);
% ed = joni_frames(2, 2);
% test = dtw_classifier_green( ...
%                        'gesture_videos/digits_model_joni_ex3.avi',...
%                        st, ed);

%% Task 5

% class_t = ones(10,1)*5000;
% 
% test = dtw_spot('gesture_videos/digits_model_joni_ex3.avi', class_t);

%% Task 6

% [tp, fp, fn] = dtw_spot_accuracy('gesture_videos/start_end_frames_model_joni_ex3.txt', test, .7)




