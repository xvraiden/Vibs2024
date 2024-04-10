% Solves an unforced translational MCK system.
%
% Important other related ODE functions: odeset
%
% ** You will need to modify this function and the 'sdof'
% ** function below. Check help on the 'odeset' function
% ** to learn its usage.

function [t,y] = ODE_2nd_Order(t_start, t_stop, y_disp, y_vel, mass, damp, stiff, force)

% Define time range.
t0 = [t_start ; t_stop];

% Define initial conditions.
y0 = [y_vel ; y_disp];

% Evaluate at the points.

% Assume default tolerance of 1.e-3; % odeset option: RelTol
[t,y] = ode23(@sdof_linear,t0,y0);
% figure(1);
% title('SDOF time history (displacement & Velocity)');
% plot(t,y(:,1), 'b', 'markerSize', 5, 'DisplayName', 'Velocity');
% hold on
% plot(t,y(:,2), 'r', 'markerSize', 5, 'DisplayName', 'Position');
% legend('show');
% xlabel('Time [sec]');
% ylabel('Amplitude [m]');

    function ydot = sdof_linear(t, y)
        xdot = y(1);
        x = y(2);
        xdotdot = (force - damp .* xdot - stiff .* x) ./ mass; % This is from the EOM.
        ydot = [xdotdot ; xdot];
    end
end