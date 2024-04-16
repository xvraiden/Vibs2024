function force_transmissibility_plot(f,TR,name)
    sgtitle(name,'FontSize', 18);

    subplot(2, 1, 1)
    plot(f,rad2deg(angle(TR)),'markerSize',10);
    title('Phase Angle', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Phase Angle (Degrees)', 'FontSize', 16);

    subplot(2, 1, 2)
    semilogy(f,abs(TR),'markerSize',10);
    title('Magnitude', 'FontSize', 18);
    xlabel('Frequency (Hertz)', 'FontSize', 16);
    ylabel('Magnitude (N/V)', 'FontSize', 16);
end