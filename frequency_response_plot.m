function frequency_response_plot(f,H,name)
    

    H11 = reshape(H(1,1,:),1,[]);
    H12 = reshape(H(1,2,:),1,[]);
    H21 = reshape(H(2,1,:),1,[]);
    H22 = reshape(H(2,2,:),1,[]);

    sgtitle(name,'FontSize', 18);
    
    subplot(2, 2, 1)
    plot(f,rad2deg(angle(H11)),f,rad2deg(angle(H12)),f,rad2deg(angle(H21)),f,rad2deg(angle(H22)),'markerSize',10);
    title('Phase Angle', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Phase Angle (Degrees)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
    
    subplot(2, 2, 3)
    semilogy(f,abs(H11),f,abs(H12),f,abs(H21),f,abs(H22),'markerSize',10);
    title('Magnitude', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Magnitude (Vout/Vin)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
    
    subplot(2, 2, 2)
    plot(f,imag(H11),f,imag(H12),f,imag(H21),f,imag(H22),'markerSize',10);
    title('Imaginary', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Imaginary (Vout / Vin)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
    
    subplot(2, 2, 4)
    plot(f,real(H11),f,real(H12),f,real(H21),f,real(H22),'markerSize',10);
    title('Real', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Real (Vout/Vin)', 'FontSize', 16);
    legend("x/F", "q/F", "x/V", "q/V");
end