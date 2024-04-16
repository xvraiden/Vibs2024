t = 0:0.1:8;
omega = 10;

voltage = half_cycle_pulse(t, omega, 1);

plot(t,voltage);