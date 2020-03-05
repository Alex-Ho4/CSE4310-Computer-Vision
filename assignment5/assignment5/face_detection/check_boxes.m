function [tp, fp, fn] = check_boxes(boxes, ground_truth, iou_thr)

% boxes = [1, 10, 1, 10];
% ground_truth = boxes+10;

tp = 0;
fp = 0;
fn = 0;

used_gt = zeros(size(ground_truth, 1),1);

% Calculate TP and FP
for i = 1:size(boxes, 1)
    
    maxIoU = 0;
    gt_index = 0;
    
    for k = 1:size(ground_truth, 1)
        
        detBox = boxes(i,:);
        gtBox = ground_truth(k,:);
        
        AintB = [max(detBox(1), gtBox(1)), min(detBox(2), gtBox(2))...
                 max(detBox(3), gtBox(3)), min(detBox(4), gtBox(4))];

        heightInt = AintB(2) - AintB(1) + 1;
        widthInt = AintB(4) - AintB(3) + 1;

        heightA = detBox(2) - detBox(1) + 1;
        widthA = detBox(4) - detBox(3) + 1;

        heightB = gtBox(2) - gtBox(1) + 1;
        widthB = gtBox(4) - gtBox(3) + 1;

        areaA = heightA * widthA;
        areaB = heightB * widthB;

        areaInt = heightInt * widthInt;
        areaUni = areaA + areaB - areaInt;

        iou = 0;

        if(heightInt > 0 && widthInt > 0)
            iou = areaInt / areaUni;
        end
        
        if max(maxIoU, iou) == iou
            maxIoU = iou;
            gt_index = k;
        end

    end
    
    if maxIoU >= iou_thr
        tp = tp + 1;
        used_gt(gt_index) = 1;
    else
        fp = fp + 1;
    end

end

% FN = number of ground truths that were not detected by any boxes
fn = numel(find(used_gt == 0));


