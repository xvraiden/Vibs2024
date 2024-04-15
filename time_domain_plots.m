function time_domain_plots(t, y, x_vel, x_disp, current, charge)

figure('Name', 'Displacement and Charge vs Time');

subplot(2, 2, 2)
plot(t,y(:,1))
title(['2DOF time history (linear EOM) [IC ' num2str(x_vel) ' m | ' num2str(x_vel) 'm/s]'])
xlabel('Time [sec]');
ylabel('Velocity [m/sec]');

subplot(2, 2, 4)
plot(t,y(:,2))
title(['2DOF time history (linear EOM) [IC ' num2str(current) ' coulombs | ' num2str(current) ' amps]'])
xlabel('Time [sec]');
ylabel('Current [amps]');

subplot(2, 2, 1)
plot(t,y(:,3))
title(['2DOF time history (linear EOM) [IC ' num2str(x_disp) ' m | ' num2str(x_vel) 'm/s]'])
xlabel('Time [sec]');
ylabel('Displacement [m]');

subplot(2, 2, 3)
plot(t,y(:,4))
title(['2DOF time history (linear EOM) [IC ' num2str(charge) ' coulombs | ' num2str(current) ' amps]'])
xlabel('Time [sec]');
ylabel('Charge [coulombs]');