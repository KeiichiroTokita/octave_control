pkg load control;
close all;
clear all;

t = 0.005;
tr = input("INPUT;tr=");
zt = input("INPUT;zt=");
tq = input("INPUT;tq=");
tr
zt
tq
Kt = 0.61;
Ktn = 0.6;
J = 0.0071;
Jn = 0.007;
Kp = J / (Kt*tr^2);
Kd = 2*zt*tr*Kp;
Kp
Kd

P = tf([Kt],[J,0,0]);
P
Pn = tf([Ktn],[Jn,0,0]);
Q = tf([1],[tq^2,2*tq,1]);
Q
sysKp = tf(Kp);
sysKp
sysKd = tf([Kd,0],[1]);
sysKd
C = sysKp + sysKd;
sysA = minreal(P*(P*Q - Pn*Q + Pn)/Pn)
sysA = minreal(C * sysA / (1 + C * sysA))
sysB = minreal(Pn/(Pn+C*P*Pn+P*Q-Pn*Q))

set(0,'defaultAxesFontSize',14);
set(0,'defaultTextFontSize',20);
step(sysA, sysB);
xlabel("Time [ms]");
ylabel("position");
legend("step response", "disturbance");
name = ["Tr=", mat2str(tr), ", Zt=", num2str(zt, '%.2e'), ", Tq=", mat2str(tq)];
title(strcat(name));
print -dpdf "file.pdf"
