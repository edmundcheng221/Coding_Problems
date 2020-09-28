% Edmund Cheng N19308437
%% Problem 1
clear; clc; format short;
UPC1 = [7 2 NaN 8 3 5 7 9 0 1 4 6 ;2 8 3 5 7 9 0 1 4 6 NaN 8;...
    0 1 4 6 NaN 8 5 9 3 3 3 2 ;NaN 8 5 9 3 3 3 2 9 0 1 2;...
    9 2 8 3 5 7 0 1 4 6 NaN 1];
ARRAY1 = isnan(UPC1);
% Value of true (1) if the corresponding element of input is NaN
% Value of false (0) otherwise
UPC1(ARRAY1) = 0;
% From previous homework
d1 = UPC1(:,(1:2:end)); % Odd Columns
d2 = UPC1(:,(2:2:end)); % Even Columns
SumOdd = sum(d1,2);
SumEven = sum(d2,2);
s = (3*(SumOdd)) + SumEven;
newdig = mod(3.*s,10);
[Row,Col] = find(ARRAY1);
[Sorted1, Idx] = sort(Row); 
Sorted2 = Col(Idx);
LinIdx = sub2ind(size(UPC1), Sorted1, Sorted2);
UPC1(LinIdx) = newdig;
disp(UPC1)
%      7     2     2     8     3     5     7     9     0     1     4     6
%      2     8     3     5     7     9     0     1     4     6     5     8
%      0     1     4     6     2     8     5     9     3     3     3     2
%      1     8     5     9     3     3     3     2     9     0     1     2
%      9     2     8     3     5     7     0     1     4     6     4     1
disp(ARRAY1)
%      0     0     1     0     0     0     0     0     0     0     0     0
%      0     0     0     0     0     0     0     0     0     0     1     0
%      0     0     0     0     1     0     0     0     0     0     0     0
%      1     0     0     0     0     0     0     0     0     0     0     0
%      0     0     0     0     0     0     0     0     0     0     1     0
d3 = UPC1(:,(1:2:end)); % Odd Columns
d4 = UPC1(:,(2:2:end)); % Even Columns
NewSumOdd = sum(d3,2);
NewSumEven = sum(d4,2);
NewTotalSum = (3*(NewSumOdd)) + NewSumEven;
% NewTotalSum =
% 
%    100
%    100
%     80
%     90
%    110
%% Problem 2
clear; clc; format short;
load RingSquare;
R1 = 1;
R2 = 2;
numCOORD = 1234;
disp('Enter the point to be used as the target:')
theTarget=input(['Enter a whole number from 1 to',num2str(numCOORD)]);
% In this problem, we must first load Ring Square. We must then input the
% whole number values between 1 to 1234. We are than plotting x and y
% values to see how far they deviate from the center point. We are given
% R1 and R2. We are looking for x and y coordinates whose distances are
% greater than R1 but less that R2. To find out their distances and whether
% or not they are greater than R1 and less than R2, we must apply the
% diatance formula. This formula is given by the square root of (x2-x1)^2
% + (y2-y1)^2. 
xValue = COORD(theTarget);
yValue = COORD(theTarget,2);
xCoordinates = COORD(1: end, 1);
% More x values = column vector
yCoordinates = COORD(1: end, 2);
% More y values = column vector
d = sqrt(((xCoordinates - xValue).^2)+ ((yCoordinates - yValue).^2)); 
% Using the distance formula
LOGICALCOORD = ((0<d) & (d>R1) & (d<R2)) | ((COORD(:,1)<xValue)...
    & (COORD(:,2)) > yValue);
LOGICALCOORDTrue = find(LOGICALCOORD == 1);
% This helps you find the place(s) where the logical array is true
xCoordinates2 = COORD(LOGICALCOORDTrue, 1);
yCoordinates2 = COORD(LOGICALCOORDTrue, 2);
COORD2 = [xCoordinates2, yCoordinates2];

% Plot the selected points with a blue dot:
plot(COORD2(:,1),COORD2(:,2),'b.');
axis square;
hold on;
% Plot the target point with a red circle:
plot(COORD(theTarget,1), COORD(theTarget,2), 'ro');
hold off;
disp('The number of points in the figure is', num2str(size(COORD2,1)));