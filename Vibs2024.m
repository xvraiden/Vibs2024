clc; clear; close all;

% Mass Properties
mass = 0.031; % kg
damp = 7.2; % N s / m
stiff = 16.5; % N / m
force = 0; % N -- no force being applied
mass = 0.031; % kg
damp = 7.2; % N s / m
stiff = 16.5; % N / m
force = 0; % N -- no force being applied

% Circuit Properties
L = 9.0 * 10^-3; % Henrys
R = 2.3; % Ohms
C = 75 * 10^-6; % Farads
Vext = 0; % V-- no Voltage being applied

% Part 1

% Define time range.
t_start = 0;
t_stop = 0.05; % Seconds

% Define initial conditions Part 1 a-c

initial_displacement = [0.023, 0, 0]; % Meters
initial_velocity = [0, 0, -3.2]; % Meters/Second
initial_charge = [0, 0, 0]; % Coulombs
initial_current = [0, -4.1, 4.7]; % Amps

L1 = length(angular_disp1);
L2 = length(angular_disp2);



colorarray = ["#A2142F","b","k","c","m", "#77AC30" ,"#EDB120", "#0072BD", "#D95319", "#4DBEEE"];

peri = zeros(2,L1+L2);

% Part a.
figure('Name', 'The Linearized Single Degree-of-Freedom Pendulum');
for i = 1: L1
    [t1, y1, t2, y2] = ODE_2nd_Order_NL(t_start, t_stop, angular_disp1(i), angular_vel, Mass, Damp, Stiff, Force);

    colororder(colorarray);
    plot(t1,y1(:,2),'markerSize', 10, 'DisplayName', 'Linear');
    hold on
    plot(t2,y2(:,2),'markerSize', 10, 'DisplayName', 'Non-Linear');
end

title('Angular Position vs Time for a Non Linear and Linearized Pendulum');
l1 = legend('0.02 Linear', '0.02 Non-Linear', '0.05 Linear', '0.05 Non-Linear', '0.1 Linear', '0.1 Non-Linear', '0.2 Linear', '0.2 Non-Linear','0.5 Linear', '0.5 Non-Linear', '1.0 Linear', '1.0 Non-Linear');
xlabel('Time [sec]');
ylabel('Angular Postition [rad]');

function prob_2dofNL
% Using MATLAB v6 syntax.
%
% Important other related ODE functions: odeset;
global NLflg

% Define time range.
t_start = 0;
t_stop = 20;
t0 = [t_start ; t_stop];

% Define initial conditions.
x_vel = 0;
x_disp = 0.075; % meters
theta_vel = 0;
theta_disp = 0.01; % radians
y0 = [x_vel ; theta_vel ; x_disp; theta_disp];

%Assume default tolerance of 1.e-3; % Accuracy
% Non-linear solution
NLflg = 1;
[t,y] = ode23(@ndof,t0,y0);
figure(1);
subplot(211), plot(t,y(:,3))
title(['2DOF time history (exact EOM) [IC ' num2str(x_disp) ' m | ' num2str(x_vel) 'm/s]'])
xlabel('Time [sec]');
ylabel('Displacement [m]');
subplot(212), plot(t,y(:,4))
title(['2DOF time history (exact EOM) [IC ' num2str(theta_disp) ' rad | ' num2str(theta_vel) ' rad/s]'])
xlabel('Time [sec]');
ylabel('Displacement [rad]');

%Assume default tolerance of 1.e-3; % Accuracy
% Linear solution
NLflg = 0;
[t,y] = ode23(@ndof,t0,y0);
figure(2);
subplot(211), plot(t,y(:,3))
title(['2DOF time history (linear EOM) [IC ' num2str(x_disp) ' m | ' num2str(x_vel) 'm/s]'])
xlabel('Time [sec]');
ylabel('Displacement [m]');
subplot(212), plot(t,y(:,4))
title(['2DOF time history (linear EOM) [IC ' num2str(theta_disp) ' rad | '
num2str(theta_vel) ' rad/s]'])
xlabel('Time [sec]');
ylabel('Displacement [rad]');

%-----------------------------------------
Final Project 5 04-Apr-2024
MECH-3080 (2024SS)
%
% Function to be integrated.
%
function ydot = ndof(t,y)
global NLflg
g = 9.81; % m / s^2
m = 10; % kg
c = 10; % N s / m
k = 16000; % N / m
m1 = 5; % kg
L = 0.1; % m
xdot = y(1);
thetadot = y(2);
x = y(3);
theta = y(4);
switch NLflg
case 0 % Linear EOM
xdotdot = 0*g -(c .* xdot + k .* x) ./ (m + m1);
thetadotdot = -g * theta / L;
case 1 % Non-linear EOM
xx = inv([ m+m1 -m1*L*sin(theta) ; -m1*sin(theta) m1*L ]) * [ (0*(m+m1)*g +
m1*L*cos(theta)*thetadot.^2 - c*xdot - k*x) ; -m1*g*sin(theta) ];
xdotdot = xx(1);
thetadotdot = xx(2);
end
ydot = [xdotdot ; thetadotdot; xdot; thetadot];