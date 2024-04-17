function hybrid_systems_2dof(t0, x_disp, x_vel, charge, current)
    global prob_num

    % Initial Velocity, Current, Displacement, and Charge
    y0 = [x_vel; current; x_disp; charge];
    
    % Numerical Ode Solver base on Eulers Method
    options = odeset("MaxStep",0.01,"InitialStep",1e-3);
    [t,y] = ode23(@ndof,t0,y0,options);

    % Function to plot the displacement, velocity, charge, and current, with the initial condiditions
    time_domain_plots(t, y, x_vel, x_disp, current, charge)
    
    % Code to zoome in on the plots for part 3
    if prob_num == 3
        [t0, lower] = closest_value_ndx(t, 0.98);
        [tf, upper] = closest_value_ndx(t, 1.08);

        t_zoom = t(lower:upper);
        y_zoom = y(lower:upper,:);

        time_domain_plots(t_zoom, y_zoom, x_vel, x_disp, current, charge)
    end
end