clc; clf; clear; close all

% Initialize System Values
m=0.031; %kg
damping=7.2; %N*s/m
k=16.5; %KN/m
L=9.0; %mH
R=2.3; %ohms
c=75; %uF
B=6.2; %Weber/m

% Correct the Units
k = k*1000;
L = L/1000;
c = c*10^-6;

f = 0:1:300;
w = f.*2.*pi;

% Transfer Function
FRF = @(w) inv(-w.^2.*[m,0;0,L] + 1i.*w.*[damping,-B;B,R] + [k,0;0,1./c]);

for z = 1:size(w,2)
    A = FRF(w(z));

    TR = (1i.*w(z).*damping + k).*A(1,2) + 1i.*w(z).*B.*A(2,2);

    H(z) = TR;
    TR2 = (damping.*w(z).*1i + k + B.*w(z).*1i).*A(1,2);
    H2(z) = TR2;
end

% Plot the Magnitude and Phase angle as a function of frequnecy
force_transmissibility_plot(f,H,'TR Plots');
force_transmissibility_plot(f,H2,'TR Plots');














