function time_domain_plots(t, y, x_vel, x_disp, current, charge)
    global prob_num
    global omega_pass
    
    figure('Name', 'Displacement and Charge vs Time Problem')

    if (prob_num == 2)
        sgtitle(['Problem: ' num2str(prob_num) ' Force and Voltage Input Frequency: ' num2str(omega_pass./(2*pi)) ' Hz/s'],'FontSize', 18);
    else
        sgtitle(['Problem: ' num2str(prob_num) ' Force and Voltage Input Frequency: ' num2str(omega_pass./(2*pi)) ' Hz'],'FontSize', 18);
    end
    
    subplot(2, 2, 2)
    plot(t,y(:,1))
    title(['Time Response [IC ' num2str(x_disp) ' m | ' num2str(x_vel) 'm/s]'])
    xlabel('Time [sec]');
    ylabel('Velocity [m/sec]');
    
    subplot(2, 2, 4)
    plot(t,y(:,2))
    title(['Time Response [IC ' num2str(charge) ' coulombs | ' num2str(current) ' amps]'])
    xlabel('Time [sec]');
    ylabel('Current [amps]');
    
    subplot(2, 2, 1)
    plot(t,y(:,3))
    title(['Time Response [IC ' num2str(x_disp) ' m | ' num2str(x_vel) 'm/s]'])
    xlabel('Time [sec]');
    ylabel('Displacement [m]');
    
    subplot(2, 2, 3)
    plot(t,y(:,4))
    title(['Time Response [IC ' num2str(charge) ' coulombs | ' num2str(current) ' amps]'])
    xlabel('Time [sec]');
    ylabel('Charge [coulombs]');
end