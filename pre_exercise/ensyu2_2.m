clear all;
close all;
pkg load control;
pkg load signal;

A = [[0 1 0]; [0 0 1]; [9 7 -1]];
B = [[0]; [0]; [1]];
C = [1 1 0];

sys = ss(A, B, C);

t = 1;

sys1 = tf([1],[0.125*t**3 0.5*t**2 t 1]);
sys2 = tf([1], [0.08*t**3 0.4*t**2 t 1]);
sys3 = tf([1], [0.15*t**3 0.5*t**2 t 1]);
[P1, Z1] = pzmap(sys1);
[P2, Z2] = pzmap(sys2);
[P3, Z3] = pzmap(sys3);

F = place(sys, P1);
sys_f = ss(A-B*F, B, C);

step(sys_f);

figure;
for i = 1:1:10
	  i
	  initial(sys_f, [0 0 i])
	  hold on;
end

