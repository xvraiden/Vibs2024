function frequency_response_plot(f,H,name)
    % Changing Masss
    figure ('Name', 'Freqeuncy Response Functions');
    sgtitle(name,'FontSize', 18);
    
    subplot(2, 2, 1)
    plot(f,rad2deg(angle(H)),'markerSize',10);
    title('Phase Angle', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Phase Angle (Degrees)', 'FontSize', 16);
    
    subplot(2, 2, 3)
    semilogy(f,abs(H),'markerSize',10);
    title('Magnitude', 'FontSize', 18);frequency
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Magnitude (Vout/Vin)', 'FontSize', 16);
    
    subplot(2, 2, 2)
    plot(f,imag(H),'markerSize',10);
    title('Imaginary', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Imaginary (Vout / Vin)', 'FontSize', 16);
    
    subplot(2, 2, 4)
    plot(f,real(H),'markerSize',10);
    title('Real', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Real (Vout/Vin)', 'FontSize', 16);
end