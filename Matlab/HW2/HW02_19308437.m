% Edmund Cheng N19308437
%% Problem 1
clear; clc; format short e;
x = 1.7;
p = -0.22;
q = 2.1;
Exact = p.*tanh(p.*x+q);
StepSize = 10 .* 10 .^(1:-2:-20);
StepSize = StepSize';
Method1 = (log(cosh(p.*(x+StepSize)+q))-log(cosh(p.*(x-StepSize)+q)))...
    ./(2.*StepSize);
r = abs((Method1 - Exact))./(Exact);
h = 1i .* StepSize;
Method2 = (imag(log(cosh(p.*(x+h)+q))))./StepSize;
r2 = abs((Method2 - Exact))./(Exact);
RELERRORS = [StepSize, r, r2];
disp('   StepSize   Relative Error 1  Relative Error 2')     
disp(RELERRORS)
%     StepSize  Relative Error 1  Relative Error 2
%    1.0000e+02    -9.1641e-01       -1.1517e+00
%    1.0000e+00    -1.9328e-03       -1.9089e-03
%    1.0000e-02    -1.9209e-07       -1.9209e-07
%    1.0000e-04    -1.7727e-11       -1.9209e-11
%    1.0000e-06    -6.0059e-10       -1.7474e-15
%    1.0000e-08    -2.4670e-08                 0
%    1.0000e-10    -1.1582e-06                 0
%    1.0000e-12    -6.5679e-05                 0
%    1.0000e-14    -3.2195e-02                 0
%    1.0000e-16    -1.0000e+00                 0
%    1.0000e-18    -1.0000e+00                 0
% After a StepSize value of approximately 1e-4, the r value, or the
% relative error started to get back to getting larger and larger. After the value of
% approximately 1e-6 in decreasing order, the r value keeps getting smaller and smaller
% meaning that the approximate value is getting closer and closer to the
% exact value. MATLAB does not calculate the values like we do
% arithmetically. It would behooves you to also use a StepSize value no greater than 1
% as the r value only gets more and more negative/ larger and larger
% negative number. 
%% Problem 2
clear; clc; format short; 
nPeople = 10;
avgWt = 75;  % average weight in Kg
sdWt = 12; % standard deviation of weight
Wts = avgWt + sdWt .* randn(nPeople,1);
rangeWt = 3;
NewWts = Wts + rangeWt * (2 * rand(nPeople,1)-1);
ChangeWts = NewWts - Wts;
RelChangeWts = ChangeWts ./ Wts; 
OUTPUT = [Wts, NewWts, ChangeWts, RelChangeWts];
disp('      Wts     NewWts   ChangeWts  RelChangeWts')
disp(OUTPUT)
[MaxValue, Index] = max(abs(ChangeWts));
[MinValue, Index1] = min(abs(ChangeWts));
FirstString = 'The person with the largest weight change';
disp(FirstString);
disp(OUTPUT(Index));
SecondString = 'whose weight change is';
disp(SecondString);
disp(OUTPUT(Index,3));
ThirdString = 'The person with the smallest relative weight change is';
disp(ThirdString);
disp(OUTPUT(Index1));
FourthString = 'whose relative weight change is'
disp(FourthString);
disp(OUTPUT(Index1,3));
% Example sample data set:
%     Wts      NewWts    ChangeWts RelChangeWts
%    82.5023   82.3278   -0.1745   -0.0021
%    77.1987   75.5817   -1.6171   -0.0209
%    62.6428   64.7086    2.0659    0.0330
%    86.3907   84.5592   -1.8314   -0.0212
%    78.6847   77.0403   -1.6445   -0.0209
%    76.6221   74.6463   -1.9758   -0.0258
%    81.1830   79.5489   -1.6340   -0.0201
%    78.1369   77.7511   -0.3858   -0.0049
%    63.7022   62.5688   -1.1334   -0.0178
%    73.0519   75.5922    2.5403    0.0348
% The person with the largest weight change
% 10
% whose weight change is
% 2.5403
% The person with the smallest relative weight change is
% 1
% whose relative weight change is
% -0.1745
%% Problem 3
clear; clc; format long;
n = 11;
xStart = 1.03;
xEnd = 1.33; 
m = 7;
x = linspace(xStart,xEnd,n);
Exact = 1./(x-1);
MATRIX1= repmat(x,7,1);

k = linspace(1,7,7)';
MATRIX2= repmat(k,1,11);

y = (2.^(MATRIX2-1))./(MATRIX1.^2.^(MATRIX2-1)+1);
Approximate = sum(y,1);

r = abs((Approximate - Exact))./(Exact);
disp(Exact)
RESULTS = [x; Approximate; Exact;r ]';

disp('       x                 Approximate           Exact            r');
disp(RESULTS); 

%        x                 Approximate          Exact           r
%1.030000000000000  54.092913300025415 33.333333333333307 0.622787399000764
%1.060000000000000  45.399025824071664 16.666666666666654 1.723941549444302
%1.090000000000000  37.696736595795784 11.111111111111102 2.392706293621623
%1.120000000000000  31.100347329904654  8.333333333333327 2.732041679588562
%1.150000000000000  25.593289072538624  6.666666666666661 2.838993360880797
%1.180000000000000  21.077327275098614  5.555555555555551 2.793918909517754
%1.210000000000000  17.416714922525365  4.761904761904763 2.657510133730326
%1.240000000000000  14.468775275851680  4.166666666666667 2.472506066204403
%1.270000000000000  12.101124941914025  3.703703703703703 2.267303734316787
%1.300000000000000  10.199198502626684  3.333333333333333 2.059759550788006
%1.330000000000000   8.667932805953221  3.030303030303030 1.860417825964564

