clc; clear; close all;

% Part 1
global prob_num
prob_num = 1;
v0 = [0, 0, -3.2];
x0 = [0.023, 0, 0];
q0 = [0, 0, 0];
I0 = [0, -4.1, 4.7];

t0 = [0 ; 0.05];

for i = 1:length(v0)
    hybrid_system_2dof(t0, x0(i), v0(i), q0(i), I0(i));
end

% Part 2
prob_num = 2;
v0 = 0;
x0 = 0;
q0 = 0;
I0 = 0;

t0 = [0, 0, 1.6, 3.2; 8, 0.8, 2.4, 4];
[m,n] = size(t0);

global j

for j = 1:m
    for i = 1:n
        hybrid_system_2dof(t0(:,j), x0, v0, q0, I0);
    end
end

% Part 3
prob_num = 3;
v0 = 0;
x0 = 0;
q0 = 0;
I0 = 0;

t0 = [0, 0.98; 8, 1.08];
[m,n] = size(t0);

global j

for j = 1:m
    for i = 1:n
        hybrid_system_2dof(t0(:,j), x0, v0, q0, I0);
    end
end