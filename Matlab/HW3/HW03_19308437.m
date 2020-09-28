% Edmund Cheng N19308437
%% Problem 1
% Part 1
clear; clc; format short;
UPCR1 = [6 6 0 5 4 3 4 4 6 3 9;...
    6 6 0 5 4 3 4 4 6 3 3;...
    0 5 1 0 0 0 1 6 4 6 1];
d1 = UPCR1(:,(1:2:end)); % Odd Columns
d2 = UPCR1(:,(2:2:end)); % Even Columns
SumOdd = sum(d1,2);
SumEven = sum(d2,2);
s = (3*(SumOdd)) + SumEven;
xSub12 = 10* ceil(s/10) - s;
disp(xSub12)
% xSub12 = 2
%          0
%          2
check = s + xSub12;
concatenated1 = [UPCR1, xSub12];
% check =
% 
%    110
%     90
%     40
% Part 2
nRandom = 6;
nKnownDigits = 11;
UPCR = floor(10 * rand(nRandom, nKnownDigits));
d3 = UPCR(:,(1:2:end)); % Odd Columns
d4 = UPCR(:,(2:2:end)); % Even Columns
SumOdd2 = sum(d3,2);
SumEven2 = sum(d4,2);
s2 = (3*(SumOdd2)) + SumEven2;
xTwelve = 10* ceil(s2/10)-s2;
disp(xTwelve)
%      0
%      3
%      5
%      2
%      4
%      2
check2 = s2 + xTwelve;
concatenated2 = [UPCR, xTwelve];
% check2 =
% 
%    110
%    110
%    130
%     80
%    100
%    120
%% Problem 2
clc; format short
% Don't need to clear because I am using some of the same variables defined
% in the first problem.
disp(concatenated1)
disp(concatenated2)
concatenated3 = [concatenated1; concatenated2];
% I concatenated the first 3 sets of upcr codes with the 6 randomly
% generated codes so that I can do them both at once.
m = 7;
odd = concatenated3(:,1:2:end);
even = concatenated3(:,(2:2:end));
odd(:,ceil(m/2)) = [];
% After this step, I added up the odd and evens excluding the 7th column.
sumOddWO7 = sum(odd,2);
sumEvenWO7 = sum(even,2);
sumOddEven = sumOddWO7 + sumOddWO7;
remainder = mod(sumOddEven,10);
remPlus1=remainder + 1;
dm = [0 3 6 9 2 5 8 1 4 7];
theMissingNumbers = dm(remPlus1);
% theMissingNumbers =
% 
%      0     4     6     2     4     8     0     0     0 
%In this problem, instead of finding out what the 12th digit is like the
%first problem, I need to eliminate a odd numbered digit. I eliminated the
%7th column of numbers for example. Then, I need to repeat what I did in
%question 1 but instead, figure out what the 7th column of missing numbers
%are. Since the missing numbers are in a odd column this time, it would be
%more difficult. This is because the equation is given by    
% s = 3(d1 +d3 + d5+d7+d9+d11) +d2+d4+d6+d8+d10; the odd columns are each
% multiplied by the number 3. 