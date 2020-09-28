%% Problem 2
clear; clc; format short;
SelectFace = menu('Pick a Number','4','6','8','10','12','20','24','30');
Nvec = [4 6 8 10 12 20 24 30]; % Vector with n values
nValue = Nvec(SelectFace);
aValue = 1;
aValue2 = aValue -1;
mValue = input('Enter the number of dies rolled: '); 
% This is what I think you meant
nTrials = input('Enter the number of trials performed: ');
% number of trials inputted by the user
ANSWERS = ceil((nValue- (aValue2))*rand(nTrials,mValue)+(aValue2));
logEven = mod(ANSWERS,2);
% Finds the even values as even number divided by 2 is always 0
NumEvens = sum(~logEven,2);
HalfEvens = NumEvens/2;
NumOdds = sum(logEven,2);
MatrixSize = NumEvens + NumOdds; % Size of the matrix
% The sum of the number of evens are 0. Thus, the size of the matrix
% represents the amount of odd values.
HalfSize = MatrixSize/2;
prime = isprime(ANSWERS);
sumPrime = sum(prime,2);
LogVec = (sumPrime > HalfEvens) & (NumOdds <= HalfSize);
NNZ = nnz(LogVec);
Prob = NNZ/nTrials;
disp([num2str(mValue),' ', num2str(nValue), '-sided dices are thrown.']);
disp(['Computed probability for meeting the condition is: ' ...
    num2str(Prob)])
% Generated Answer!
% Enter the number of dies rolled: >> 7
% Enter the number of trials performed: 1000000
% 7 8-sided dices are thrown.
% Computed probability for meeting the condition is: 0.30633
%% Problem 1
clear; clc; format long;
rng(0);
points = 100000;
dim = input('The chosen number of dimensions are:');
f = 0.01;
theMin = 1-f;
numPoints = rand(points, dim);
boundaries = (theMin <= numPoints);
sumBounds = sum(boundaries,2);
logSumBound = (sumBounds > 0);
NNZ = nnz(logSumBound);
totalTrials = points;
prob = NNZ/ (totalTrials);
disp(prob)
final = ['For a hypercube of dimension:', num2str(dim), '  the fraction is',...
      num2str(prob)];
disp(final)
% For a hypercube of dimension:1  the fraction is   0.0103
% This number expected to be very small because the area that we want the
% points to land is very small. It is expected that as the number of
% dimensions increase, the probability also increases because there are
% more space for the points to land and still satisfy the conditions. 
% For a hypercube of dimension:2  the fraction is   0.02061
% For a hypercube of dimension:5  the fraction is   0.04995
% For a hypercube of dimension:20 the fraction is   0.18094
% For a hypercube of dimension:100 the fraction is  0.62919
% For a hypercube of dimension:300 the fraction is  0.95013
% For a hypercube of dimension:600 the fraction is  0.99755
% As the number of dimensions increases, the fraction gets larger and
% larger. This means that the probability of meeting the boundary
% conditions are increasing. 