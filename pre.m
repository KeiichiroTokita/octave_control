# 伝達関数の結合
num1=[1 1]; den1=[2 1]; num2=[1 2]; den2=[3 1];
sys1 = tf(num1, den1); sys2 = tf(num2, den2);
sys3 = sys1 * sys2;
sys4 = sys1 + sys2;
sys5 = feedback(sys1, sys2, -1);


# 演習2
sys1 = tf([1 1], [3 1]);
sys2 = tf([3], [1 2 2]);
sys3 = tf([2], [1 1 6 4]);
step(sys1);
step(sys2);
step(sys3);

# 演習3
a = -1, b=1
a = , b = 1
a = -1, b = 3
a =  1, b = 3
sys0 = tf([1], conv([1 -a-b*i] ,[1 -a+b*i])); step(sys0);

# 演習4
zeta = 4; omega = 10; k = 1;
sys = tf([k * omega^2], [1 2*zeta*omega omega^2]); step(sys);

# 演習5
sys1 = tf([1], conv([1 5], [1 3])); step(sys1);
sys2 = tf([1 4], 4 * conv([1 5], [1 3])); step(sys2);
sys3 = tf([1 50], 50 * conv([1 5], [1 3])); step(sys3);

# 演習6
sys = tf(2 * [1 0.2], conv([1 0.3], [1 0.5]));
bode(sys);

# 演習7
roots([5 6 6 2])
roots([3.78 8.56 5.78 4.78 2.65])
roots([0.29 2.59 6.86 9.45 10.28 4.64])

# 演習8
sys1 = tf([2], conv([1 0], conv([0.5 1], [0.1 1])));
sys2 = tf(10 * conv([5 1], [1 1]), conv([50 1], [0.2 1]));
bode(sys1);
bode(sys1 * sys2);

# 演習9
k = 1
sys1 = tf([1] * k, [1 1 0]);
rlocus(sys1);

# 演習10
k = 1
t = 1
sys1 = tf([1], [1 3 2 0]);
sys2 = tf([1 1.5], [t, 1]);
rlocus(sys1 * sys2);


# 演習2
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

