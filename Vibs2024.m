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
title(['2DOF time history (exact EOM) [IC ' num2str(x_disp) ' m | ' num2str(x_vel) '
m/s]'])
xlabel('Time [sec]');
ylabel('Displacement [m]');
subplot(212), plot(t,y(:,4))
title(['2DOF time history (exact EOM) [IC ' num2str(theta_disp) ' rad | '
num2str(theta_vel) ' rad/s]'])
xlabel('Time [sec]');
ylabel('Displacement [rad]');
%Assume default tolerance of 1.e-3; % Accuracy
% Linear solution
NLflg = 0;
[t,y] = ode23(@ndof,t0,y0);
figure(2);
subplot(211), plot(t,y(:,3))
title(['2DOF time history (linear EOM) [IC ' num2str(x_disp) ' m | ' num2str(x_vel) '
m/s]'])
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