% Homework 2 Question D MECH 3080
% Xavier Veselovec 1/17/2024

% Generate time array to solve over
t = 0:0.01:6;

% Compute solution
x = 3.2 * cos(2 * pi * t) - 4.6 * sin(3 * pi * t);

% Plot Solution
hold on
plot(t,x);
title("Amplitude vs Time");
xlabel("Time (s)");
ylabel("Amplitude (in)");

% Plot marks to indicate period
plot(1.13, x(114), "ro");
plot (3.13, x(314), "ro");



%Hello 
