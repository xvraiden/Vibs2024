clc; clf; clear;


m=0.031; %kg
damping=7.2; %N*s/m
k=16.5; %KN/m
L=9.0; %mH
R=2.3; %ohms
c=75; %uF
B=6.2; %Weber/m


k = k*1000;
L = L/1000;
c = c*10^-6;

f = 0:1:300;
w = f.*2.*pi;



FRF = @(w) inv(-w.^2.*[m,0;0,L] + 1i.*w.*[damping,-B;B,R] + [k,0;0,1./c]);

TR = @(w) ([damping,0;0,B] + [k,0;0,0]) * FRF(w);

for z = 1:size(w,2)
    TR(w(z))
    A = TR(w(z));
    H(z) = abs(A);
end



force_transmissibility_plot(f,H,'TR Plots')














