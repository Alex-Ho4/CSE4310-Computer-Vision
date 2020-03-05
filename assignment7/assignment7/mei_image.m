function result = mei_image(filename, start_frame, end_frame)

frames = double(read_video_frames(filename));
grayscale = (frames(:,:,1,:) + frames(:,:,2,:) + frames(:,:,3,:))/3;
grayscale = squeeze(grayscale);

result = zeros(240, 320);
for i = start_frame+1:end_frame-1
    frame1 = grayscale(:,:,i-1);
    frame2 = grayscale(:,:,i);
    frame3 = grayscale(:,:,i+1);
    
    diff1 = abs(frame2-frame1);
    diff2 = abs(frame2-frame3);
    
    diff = min(diff1, diff2);
    
    result = result + diff;
end

% Normalize Result between 0 and 255
low = min(result(:));
high = max(result(:));
range = high - low;

result = (result - low) * 255 / range;

% Test motion energy image
%imshow(result, []);

end

