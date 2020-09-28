%% Problem 1
clear; clc; format short
disp('Welome to Dirt-Cheap-Tickets')
Age = input('Enter Age');
% Tells us what happens if the child is less than 2, and between 2 and 15
if Age < 2 
    disp('You Will be Charged a Total of $0 for the child.')
    disp('You will not travel alone and will not reveive a seat')
% what happens if you are less than 5
elseif Age < 5
    input2 = input('Enter 1 if traveling alone, otherwise enter 0:');
    if input2 == 1
        disp('You cannot Travel Alone and will be charged $0')
    else
        disp('You will be charged $320 or 20% off the full price')
    end
% You know that you are older or equal to 5.
% tells you what happens if you are between 5 and 15. 
elseif Age < 15
    input3 = input('Enter 1 if traveling alone, otherwise enter 0');
    if input3 == 1
        disp('You may travel alone, but, you will be charged an additional minor fee of $100')
        disp('you will also be charged $320 which is 20% off full fare')
    else
        disp('You will be charged $320 for your fare only')
    end
% tells you what happens if you are a senior citizen and are older or equal
% to 65 years of age
elseif Age >= 65
    disp('You will be charged $360 or 10% off the full fare price')
% Next statement tells you what happens if you do not fit any of the
% statements above. You are 15 years of age or older but less than 65 years
% of age.
else
    disp('You will be charged the full fare price of $400')
end   
