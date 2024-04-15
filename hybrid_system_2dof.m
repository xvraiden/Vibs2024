function hybrid_systems_2dof(t0, x_disp, x_vel, charge, current)
    y0 = [x_vel ; current ; x_disp; charge];
    
    [t,y] = ode23(@ndof,t0,y0);
    time_domain_plots(t, y, x_vel, x_disp, current, charge)
end

function ydot = ndof(t,y)
    global prob_num
    global j

    m = 0.031; % kg
    c = 7.2; % N*s/m
    k = 16.5*10^3; % N/m
    
    R = 2.3; % ohms
    L = 9.0*10^-3; % Henerys
    C = 75*10^-6; % Farads
    B = 6.2; % Weber / m

    xdot = y(1);
    qdot = y(2);
    x = y(3);
    q = y(4);

    switch prob_num
        case 1
            force = 0;
            voltage = 0;
        case 2
            omega = 29*2*pi;
            force = 0;

            switch j
                case 1
                    voltage = 4.2.*sin(omega.*t.^2);
                case 2
                    voltage = 4.2.*cos(omega.*t.^2);
            end

        case 3
            force = 0;

            switch j
                case 1
                    omega = 220*2*pi;
                case 2
                    omega = 30*2*pi;
            end

            voltage = 4.5.*sin(omega.^2);
    end
    
    xdotdot = (force - k.*x - c.*xdot + qdot.*B)./m;
    qdotdot = (voltage - q./C - R.*qdot - xdot.*B)./m;
    
    ydot = [xdotdot; qdotdot; xdot; qdot];
end