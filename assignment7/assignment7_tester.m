% restoredefaultpath;
% clear all;
% close all;

addpath assignment7

startF = 240;
endF = 330;
thresholds = [800, 450, 800, 500, 300, 800, 800, 800, 800, 800];

Q3 = mei_classifier('gesture_videos/digits_model_joni_ex3.avi', startF, endF);

% % % Task 2
% % 
% % Q2 = green_hand_trajectory('gesture_videos/digits_model_joni_ex3.avi', startF, endF);
% % 
% % % Task 4
% % 
% % Q4 = dtw_classifier_green('gesture_videos/digits_model_joni_ex3.avi', startF, endF);
% % 
% % % Task 5
% % 
% % Q5 = dtw_spot('gesture_videos/digits_model_joni_ex3.avi', thresholds);