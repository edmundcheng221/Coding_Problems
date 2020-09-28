% Edmund Cheng N19308437
% Problem 1
x = 1.7;
p = -0.22;
q = 2.1;
format long
Exact = p*tanh(p*x+q);
disp(Exact);
% hVariable     rValue
% 100           -0.916411575372562
% 10            -0.243327573969221
% 1             -0.001932824848970
% 1e-1          -1.921032383919163e-05
% 1e-2          -1.920914169394759e-07
% 1e-3          -1.920540511790557e-09
% 1e-4          -1.772737390951998e-11
% 1e-5          -4.461099431001061e-11
% 1e-6          -6.005928037008764e-10
% 1e-10         -1.158203499234295e-06
% 1e-15         -0.075339439322428
% 1e-20         -1
% After an hVariable value of approximately 1e-5, the r value, or the
% relative error started to get back to getting larger and larger. Before the value of
% approximately 1e-10, the r value keeps getting smaller and smaller
% meaning that the approximate value is getting closer and closer to the
% exact value. MATLAB does not calculate the values like we do
% arithmetically. It would behooves you to also use a h value no greater than 1
% as the r value only gets more and more negative/ larger and larger
% negative number. 
hVariable=1e-20;
Approximate = (log(cosh(p*(x+hVariable)+q))-log(cosh(p*(x-hVariable)+q)))/(2*hVariable);
r = abs((Approximate - Exact))/(Exact);
%% Problem 2
% Step Size used          Method 1 relative error          Method 2
% 100                     -0.916411575372562               -1.151741798412789            
% 10                      -0.243327573969221               -0.080177422080603                       
% 1                       -0.001932824848970               -0.001908920821619           
% 1e-1                    -1.921032383919163e-05           -1.920793331526026e-05       
% 1e-2                    -1.920914169394759e-07           -1.920911667886388e-07          
% 1e-3                    -1.920540511790557e-09           -1.920912848071423e-09        
% 1e-4                    -1.772737390951998e-11           -1.920919165690629e-11          
% 1e-5                    -4.461099431001061e-11           -1.919480899190535e-13 
% 1e-6                    -6.005928037008764e-10           -1.747426588898947e-15
% 1e-10                   -1.158203499234295e-06           -1.344174299153036e-16
% 1e-15                   -0.075339439322428               0
% 1e-20                   -1                               0
x = 1.7;
p = -0.22;
q = 2.1;
Exact = p*tanh(p*x+q);
format long
stepSize= 1e-10;
h = i*stepSize;
complexApproximation = (imag(log(cosh(p*(x+h)+q))))/stepSize;
r2 = abs((complexApproximation - Exact))/(Exact)
% For method 2 the r (relative error) values were generally similar to the
% r values in method 1 for h values (Step Size) between 1 and 1e-4. After
% 1e-4, as I used smaller step size values, I kept getting smaller negative
% numbers for method 2. However, after 1e-10, the r values for method 2
% became 0 and kept being 0 as I continue increasing the step size value.
% In method 1, the r values got smaller and smaller, but, after uing h
% values less than 1e-5, the r values started increasing once again.

% In this assignment, I learned that MATLAB calculates the limit/
% derivatives differently than we do arithmetically. When we calculate a
% limit or derivative, we tend to use exact/theoretical values. However, a
% computer only has so much RAM and thus uses estimations a lot. If we use
% a small numbers (h values) that keep getting smaller, eventually, there
% will be a huge margin of error in MATLAB. Method 1 and method 2 are
% different ways of calcualting the derivative, and they both have limits
% in how small/ large a h value can be used.