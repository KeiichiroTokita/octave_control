clear all
kd = 0.625;
kp = 135/16;
ki = 2025/64;

sys1 = tf([400], [1 30 200 0]);
sys3 = tf(kp * [1], [1]) + ki * tf([1],[1 0]) + tf(kd * [1 0], [1]);
sys4 = minreal(sys1 * sys3 / (1 + sys1 * sys3));

t = 0:100e-6:2;
step(sys4, t) 
