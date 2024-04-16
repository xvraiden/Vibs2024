clear; clc; clf;

timeStep = 0.001;
endTime = 2;
F = 10; %Hz
w = F*2*pi;
period = 1/F;
pulse = 1; %pulse interval


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















