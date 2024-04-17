function ydot = ndof(t,y)
    global prob_num
    global j
    global force_type
    global omega_pass
    
    % Hard Coded Values for the Physical System
    m = 0.031; % kg
    c = 7.2; % N*s/m
    k = 16.5*10^3; % N/m
    
    % Hard Coded Values for the Electrical System
    R = 2.3; % ohms
    L = 9.0*10^-3; % Henerys
    C = 75*10^-6; % Farads
    B = 6.2; % Weber / m

    % Displacement, Velocity, Charge, and Current at time t
    xdot = y(1);
    qdot = y(2);
    x = y(3);
    q = y(4);
    
    % Switch Case to determine the output type depending on the problem number
    switch prob_num
        
        % Problem 1 Force and Voltage Inputs
        case 1
            force = 0;
            voltage = 0;
            force_type = 'Static';

        % Problem 2 Force and Voltage Inputs
        case 2
            force = 0;
            force_type = 'Static';

            % Switch statement for the two different voltage input types
            switch j
                case 1
                    voltage = 4.2.*sin(omega_pass.*t.^2);
                case 2
                    voltage = 4.2.*cos(omega_pass.*t.^2);
            end

        % Problem 3 Force and Voltage Inputs
        case 3
            % Function to calculate the half_cycle_pulse
            voltage = half_cycle_pulse(t, omega_pass, 1);
            force = 0;
    end
    
    % Equations for acceleration and dI/dt at time t
    xdotdot = (force - k.*x - c.*xdot + qdot.*B)./m;
    qdotdot = (voltage - q./C - R.*qdot - xdot.*B)./L;
    
    ydot = [xdotdot; qdotdot; xdot; qdot];
end