function hybrid_systems_2dof(t0, x_disp, x_vel, charge, current, iter, prob_num)

y0 = [x_vel ; current ; x_disp; charge];

[t,y] = ode23(@ndof,t0,y0);
time_domain_plots(t, y, x_vel, x_disp, current, charge)

function ydot = ndof(t,y)

m = 0.031; % kg
c = 7.2; % N*s/m
k = 16.5*10^3; % N/m

R = 2.3; % ohms
L = 9.0*10^-3; % Henerys
C = 75*10^-6; % Farads

xdot = y(1);
qdot = y(2);
x = y(3);
q = y(4);

xdotdot = (force - k.*x - c.*xdot + qdot.*B)./m;
qdotdot = (voltage - q./c - R.*qdot - xdot.*B)./m;

ydot = [xdotdot ; qdotdot; xdot; qdot];