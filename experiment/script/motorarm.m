close all;
clear all;

t=0.005;
zt=input("INPUT;zt=");
tr=input("INPUT;tr=");
Kt=0.6;
J=0.007;
Jn=0.007;
Kp=J/(Kt*tr^2);
Kd=2*zt*tr*Kp;
Kp
Kd

P=tf([Kt],[J,0,0]);
P
sysKp=tf(Kp);
sysKp
sysKd=tf([Kd,0],[t,1]);
sysKd
sysA=P*(sysKp+sysKd);
sysA
fbA=sysA/(sysA+1);
fbA
step(fbA);

