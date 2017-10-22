pkg load control;
close all;
clear all;

t = 0.005;
tr = input("INPUT;tr=")
zt = input("INPUT;zt=")

Kt = 0.6;
J = 0.007;
Kp = J/(Kt*tr^2);
Kd = 2*zt*tr*Kp;
Kp
Kd

sysmotor = tf([Kt],[J,0,0]);
sysmotor
sysKp = tf(Kp);
sysKp
sysKd = tf([Kd,0],[t,1]);
sysKd
sysA = sysmotor * (sysKp + sysKd);
fbA = sysA / (sysA + 1);

set(0,'defaultAxesFontSize',14);
set(0,'defaultTextFontSize',20);
step(fbA);
xlabel("Time [ms]");
ylabel("position");
name = ["Tr=", mat2str(tr), ", Zt=", num2str(zt, '%.2e')];
title(strcat(name));
legend("step response");
print -dpdf "file.pdf";

