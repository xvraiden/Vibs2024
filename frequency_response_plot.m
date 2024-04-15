function frequency_response_plot(f,H,name)
    figure ('Name', 'Freqeuncy Response Functions');
    sgtitle(name,'FontSize', 18);
    
    subplot(2, 2, 1)
    plot(f,rad2deg(angle(H(1,1))),f,rad2deg(angle(H(1,2))),f,rad2deg(angle(H(2,1))),f,rad2deg(angle(H(2,2))),'markerSize',10);
    title('Phase Angle', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Phase Angle (Degrees)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
    
    subplot(2, 2, 3)
    semilogy(f,abs(H(1,1)),f,abs(H(1,2)),f,abs(H(2,1)),f,abs(H(2,2)),'markerSize',10);
    title('Magnitude', 'FontSize', 18);frequency
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Magnitude (Vout/Vin)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
    
    subplot(2, 2, 2)
    plot(f,imag(H(1,1)),f,imag(H(1,2)),f,imag(H(2,1)),f,imag(H(2,2)),'markerSize',10);
    title('Imaginary', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Imaginary (Vout / Vin)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
    
    subplot(2, 2, 4)
    plot(f,real(H(1,1)),f,real(H(1,2)),f,real(H(2,1)),f,real(H(2,2)),'markerSize',10);
    title('Real', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Real (Vout/Vin)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
end