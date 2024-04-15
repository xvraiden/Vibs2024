clc; clf; clear;


m=0.031; %kg
damping=7.2; %N*s/m
k=1.65; %KN/m
L=9.0; %mH
R=2.3; %ohms
c=75; %uF
B=6.2; %Weber/m


k = k*1000;
L = L/1000;
c = c*10^-6;

f = 0:10:300;
w = f.*2.*pi;



FRF = @(w)inv(-w.^2.*[m,0;0,L] + 1i.*w.*[damping,-B;B,R] + [k,0;0,1./c]);

for z = 1:size(w,2)
    A = FRF(w(z));
    H(1,1,z) = A(1,1);
    H(1,2,z) = A(1,2);
    H(2,1,z) = A(2,1);
    H(2,2,z) = A(2,2);
end



frequency_response_plot(f,H,'FRF Plots')

















