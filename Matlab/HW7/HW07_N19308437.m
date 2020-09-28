%% Problem 1
clear; clc; format short
UPC1 = input('Enter UPC vector with a NaN value');% [7 2 NaN 8 3 5 7 9 0 1 4 6]
lengthVec = length(UPC1);
totalSum = 0;
for i = 1:lengthVec;
    if isnan(UPC1(i)) 
        position = i;
        UPC1(i)=0;
    end
    if mod(i,2)
        totalSum = totalSum + 3*UPC1(i);
    else
        totalSum = UPC1(i) + totalSum;
    end
end
missingNum = mod(3*totalSum,10);
UPC1(position) = missingNum;
disp(['The value is computed to be ' num2str(missingNum)])
disp(['The NaN is located at position: ' num2str(position)]);
disp(['The Corrected UPC is: ' num2str(UPC1)])

% If the digit in the matrix is NaN, isnan displays a value of 1 or true.
% If the digit in the matrix is not NaN, isnan displays a value of 0 which
% represents false.
%% Problem 2
clear; clc; format short
PE = 0.41;
PN = 0.22;
PW = 0.15;
PS = 0.22;
xPosition = 0;
yPosition = 0;
xOne = -7;
xTwo = 7;
yOne = -5;
yTwo = 5;
dist = 0.5;
xBound1 = xOne - dist;
xBound2 = xTwo + dist;
yBound1 = yOne - dist;
yBound2 = yTwo + dist; 
a = 1;
b = 6;
randprob = rand(0,1);
theSpeed = ceil((b-(a-1))*rand(a,b)+ (a-1));
timeStepnum = 11; 
pValues = [PE PN PW PS];
cumulativeSum = cumsum(pValues);
disp('timeStep      Rand#     Speed     xPosition     yPosition')
for i = 1:timeStepnum
    thedirection = rand(1);
    if thedirection < cumulativeSum(1) % East
        xPosition = xPosition + theSpeed; 
    elseif thedirection < cumulativeSum(2) % North
        yPosition = yPosition + theSpeed;
    elseif thedirection < cumulativeSum(3)% West
        xPosition = xPosition - theSpeed;
    elseif thedirection < cumulativeSum(4) % South
        yPosition = yPosition - theSpeed;    
    end 
    % To set the boundaries and conditions for the direction the particle
    % moves in
    if xPosition > xTwo
        xPosition = 2 * xTwo - (xPosition-1);
    elseif yPosition > yTwo
        yPosition = 2 * yTwo - (yPosition -1);
    elseif xPosition < xOne 
        xPosition = 2 * xOne -(xPosition + 1);
    elseif yPosition < yOne - (yPosition +1) 
    end
    % To set the boundaries and conditions for when the particle collides
    % with the wall.
    TheData = [timeStepnum, thedirection, theSpeed, xPosition, yPosition];
    disp(TheData)
end