clear all;
close all;
t = 1;

sys1 = tf([1],[0.00097*t**5 0.0156*t**4 0.125*t**3 0.5*t**2 t 1]);
sys2 = tf([1], [0.0004*t**5 0.008*t**4 0.08*t**3 0.4*t**2 t 1]);
sys3 = tf([1], [0.003*t**5 0.03*t**4 0.15*t**3 0.5*t**2 t 1]);


[Y1, T1, X1] = step(sys1, 1:0.1:7);
[Y2, T2, X2] = step(sys2, 1:0.1:7);
[Y3, T3, X3] = step(sys3, 1:0.1:7);

plot(T1, Y1, 'g');
hold on;
plot(T2, Y2, 'r');
plot(T3, Y3);

[P1, Z1] = pzmap(sys1);
[P2, Z2] = pzmap(sys2);
[P3, Z3] = pzmap(sys3);

figure;
plot(P1, 'gx');
hold on;
plot(Z1, 'go');
plot(P2, 'rx');
plot(Z2, 'ro');
plot(P3, 'bx');
plot(Z3, 'ro');
