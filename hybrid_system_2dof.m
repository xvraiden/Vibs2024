function hybrid_systems_2dof(t0, x_disp, x_vel, charge, current)
    
    % Initial Velocity, Current, Displacement, and Charge
    y0 = [x_vel; current; x_disp; charge];
    
    % Numerical Ode Solver base on Eulers Method
    options = odeset("MaxStep",0.01,"InitialStep",1e-3);
    [t,y] = ode23(@ndof,t0,y0,options);

    % Function to plot the displacement, velocity, charge, and current, with the initial condiditions
    time_domain_plots(t, y, x_vel, x_disp, current, charge)
end