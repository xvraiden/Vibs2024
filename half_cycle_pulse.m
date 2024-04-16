function V = half_cycle_pulse(t, w, pulse)
    %F is frequency in Hz
    %pulse is the pulse interval
    
    F = w/(2*pi);

    period = 1/F;
    
    I = 0;
    
    while t > I+period/2
        I=I+pulse;
    end
    
    
    if t > I
        V = 4.5*sin(w*(t-I));
    else
        V = 0;
    end
end