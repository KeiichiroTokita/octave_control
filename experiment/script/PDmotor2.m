close all;
clear all;

t=0.005;
zt=input("INPUT;zt=")
  tr=input("INPUT;tr=")

Kt=0.6;
J=0.003;
Kp=J/(Kt*tr^2);
Kd=2*zt*tr*Kp;
Kp
Kd

sysmotor=tf([Kt],[J,0,0]);
sysmotor
sysKp=tf(Kp);
sysKp
sysKd=tf([Kd,0],[t,1]);
sysKd
sysA=sysmotor*(sysKp+sysKd);
fbA=sysA/(sysA+1);
step(fbA);

