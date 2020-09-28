%% Problem 1
clear; clc; format short
MTX = [7 2 2 8 3 5 7 9 0 1 4 6;NaN 2 2 8 3 5 7 9 0 1 4 6; 7 2 2 8 3 5 7 9 0 1 4 NaN...
    ;7 2 2 8 3 NaN NaN 9 NaN 1 4 6;7 2 2 8 3 5 NaN 9 0 1 4 NaN...
    ;2 8 3 5 7 9 0 1 4 6 NaN 8;0 1 4 6 NaN 8 5 9 3 3 3 2 ... 
    ;NaN 8 5 9 3 3 3 2 9 0 1 2;1 NaN NaN 9 3 3 3 2 9 NaN 1 2 ...
    ;9 2 8 3 5 7 0 1 4 6 NaN 1]; % This matrix was given to you
rowNum = input('Enter the row number to be used');
cumulativesum = 0;
i = 0;
count = 0;
while count < 2 && i < (12) % conditions in which code runs
    i = i + 1;
    if isnan(MTX(rowNum, i))
        count = count + 1;
        nanPos = i;
    elseif mod(i,2) == 0
        evenPos = MTX(rowNum, i)*3;
        cumulativesum = cumulativesum + evenPos;
    else
        oddPos = MTX(rowNum, i);
        cumulativesum = cumulativesum + oddPos;
    end
end

% Now that we are done with the while statement and counting, we can
% display the UPC code if possible

if count < 1
    disp('This UPC code has no bad digits')
elseif count >= 2 
    disp('Too many bad digits to be corrected')
else
    if mod(nanPos, 10)
        missingVal = 10* ceil(cumulativesum/10) - cumulativesum;
    else
        missingVal = mod(cumulativesum * 3 , 10);
    end
   
    MTX(rowNum, nanPos) = missingVal;
    disp(['The NaN is located at position ' num2str(nanPos)])
    disp(['The Missing Value is Computed to be a ' num2str(missingVal)])
    disp(['The Corrected UPC is ' num2str(MTX(rowNum,:))])
end