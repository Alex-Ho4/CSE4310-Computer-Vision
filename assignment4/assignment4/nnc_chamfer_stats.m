function [accuracy, confusion_matrix] = nnc_chamfer_stats()

    accuracy = 0;
    confusion_matrix = zeros(10);

    for i = 1:10
        for j = 1:10
            
            class = mod(i,10);
            
            test = sprintf('digits_test/label%i_test%i.png', class, j);            
            result = nnc_chamfer(imread(test));
            
            if result == class
                accuracy = accuracy + 1;
            end
            
            if result == 0
                result = 10;
            end
            
            confusion_matrix(i, result) = confusion_matrix(i, result) + 1/10;
            
        end
    end
    
    accuracy = accuracy / 100;

end