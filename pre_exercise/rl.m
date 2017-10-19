% 演習2
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