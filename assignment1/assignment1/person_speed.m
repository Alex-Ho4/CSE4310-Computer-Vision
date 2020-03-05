function [rows_per_frame, cols_per_frame] = person_speed(filename1, filename2)

    figure(1)
    [tr1, br1, lc1, rc1] = find_bounding_box(filename1);
    figure(2)
    [tr2, br2, lc2, rc2] = find_bounding_box(filename2);
    
    centroid1 = [mean(tr1:br1), mean(lc1:rc1)];
    centroid2 = [mean(tr2:br2), mean(lc2:rc2)];
    
    [t,frame1] = parse_frame_name(filename1);
    [t,frame2] = parse_frame_name(filename2);
    
    framediff = abs(frame2-frame1);
    
    rows_per_frame = ( centroid2(1) - centroid1(1) ) / framediff;
    cols_per_frame = ( centroid2(2) - centroid1(2) ) / framediff;
    
end