function [tp, fp, fn] = dtw_spot_accuracy(ground_truth, gestures, iou_threshold)

fid = fopen(ground_truth, 'r');
contents = textscan(fid, '%s');
contents = contents{1};
fclose(fid);

gt_size = size(contents,1)/3;
gt_file = zeros(gt_size, 3);

ind = 1;
for k = 0:size(contents,1)-1
    gt_file(ind, mod(k, 3) + 1) = str2double(contents(k+1));
    if mod(k, 3) == 2
        ind = ind+1;
    end
end

tp = 0;
fp = 0;
fn = 0;

used_gt = zeros(gt_size,1);

% Calculate TP and FP
for i = 1:size(gestures, 1)
    
    maxIoU = 0;
    gt_index = 0;
    gt_class = 0;
    
    for k = 1:gt_size
        
        data_start = gestures(i, 1);
        data_end = gestures(i, 2);
        gt_start = gt_file(k, 2);
        gt_end = gt_file(k, 3);
        
        gt_area = gt_end - gt_start + 1;
        data_area = data_end - data_start + 1;

        inter = min(gt_end, data_end) - max(gt_start, data_start) + 1;
        union = gt_area + data_area - inter;

        iou = 0;

        if(inter > 0)
            iou = inter / union;
        end
        
        if max(maxIoU, iou) == iou
            maxIoU = iou;
            gt_class = gt_file(k, 1);
            gt_index = k;
        end

    end
    
    if maxIoU >= iou_threshold & gt_class == gestures(i,3);
        tp = tp + 1;
        used_gt(gt_index) = 1;
    else
        fp = fp + 1;
    end

end

% FN = number of ground truths that were not detected by any boxes
fn = numel(find(used_gt == 0));

end