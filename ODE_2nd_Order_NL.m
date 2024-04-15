function [t1,y1,t2,y2] = ODE_2nd_Order_NL(t_start, t_stop, y_disp, y_vel, mass, damp, stiff, force)

% Define time range.
t0 = [t_start ; t_stop]

% Define initial conditions.
y0 = [y_vel ; y_disp];

% Evaluate at the points.

% Assume default tolerance of 1.e-3; % odeset option: RelTol
[t1,y1] = ode23(@sdof_linear,t0,y0);
[t2,y2] = ode23(@sdof_sin,t0,y0);

    function ydot = sdof_linear(t, y)
        xdot = y(1);
        x = y(2);
        xdotdot = (force - damp .* xdot - stiff .* x) ./ mass; % This is from the EOM.
        ydot = [xdotdot ; xdot];
    end

    function ydot = sdof_sin(t, y)
        xdot = y(1);
        x = y(2);
        xdotdot = (force - damp .* xdot - stiff .* sin(x)) ./ mass; % This is from the EOM.
        ydot = [xdotdot ; xdot];
    end
end