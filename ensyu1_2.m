sys1 = tf([400], [1 30 200 0]);
[R, k] = rlocus(sys1);

for K = 14.9:0.01:100
	  sys2 = minreal(sys1 * K / (1 + sys1 * K));
K
pole(sys2)
  if max(real(pole(sys2))) > 0
  break;
end
end


% rl.mで求める
km = 15
omega = 14

sys1 = tf([400], [1 30 200 0]);
sys2 = minreal(sys1 * km / (1 + sys1 * km));
abs(pole(sys2)) % これが周波数

kp = km * 0.6;
kd = pi * kp / (4 * omega);
ki = kp * omega / pi;

sys3 = tf(kp * [1], [1]) + ki * tf([1],[1 0]) + tf(kd * [1 0], [1]);
sys4 = minreal(sys1 * sys3 / (1 + sys1 * sys3));

bode(sys3 * sys1) %開ループ特性
