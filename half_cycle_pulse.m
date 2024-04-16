function [time,V] = half_cycle_pulse(timeStep, endTime, F, w, pulse)
%F is frequency in Hz
%pulse is the pulse interval

period = 1/F;


I = 0;
p=0;

for t = 0:timeStep:endTime
    if t> I+period/2;
        I=I+pulse;
    end
    p=p+1;
    time(p) = t;
    if t > I
        V(p) = 4.5*sin(w*(t-I));
    else
        V(p) = 0;
    end
    
    
end


plot(time,V)

