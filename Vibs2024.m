clc; clear; close all;
global f
global t
global j
global prob_num
global omega_pass

% Part 1
prob_num = 1;

% Initial Conditions
v0 = [0, 0, -3.2];
x0 = [0.023, 0, 0];
q0 = [0, 0, 0];
I0 = [0, -4.1, 4.7];
omega = 0;
omega_pass = omega;

% Time Intervals
t0 = [0 ; 0.05];

% Calculate the Values and Plot the Graphs for each of the different Initial Condiditions
for i = 1:length(v0)
    hybrid_system_2dof(t0, x0(i), v0(i), q0(i), I0(i));
end

% Part 2
prob_num = 2;

% Initial Condititions
v0 = 0;
x0 = 0;
q0 = 0;
I0 = 0;
omega = 29*2*pi;
omega_pass = omega;

% Time Intervals
t0 = [0, 0, 1.6, 3.2; 8, 0.8, 2.4, 4];
[m,n] = size(t0);

% Calculate the Values and Plot the Graphs for each of the different time intervals
for j = 1:m
    for i = 1:n
        hybrid_system_2dof(t0(:,i), x0, v0, q0, I0);
    end
end

% Part 3
prob_num = 3;

% Initial Condidions (Same as Part 2)
omega = [110, 220, 30].*2*pi;

% Time Intervals
t0 = [0; 8];
[m,n] = size(t0);

% Calculate the Values and Plot the Graphs of each of the different time intervals
for i = 1:length(omega)
    omega_pass = omega(i);
    hybrid_system_2dof(t0, x0, v0, q0, I0);
end