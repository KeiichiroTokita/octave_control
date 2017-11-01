#!bin/bash

# 引数を2つ取った時にはresult.dataを改名する。
if [ $# -eq 2 ]; then
    result_file_name=./result/result_$1_$2.data
    mv -i ./result/result.data ${result_file_name}
else
    result_file_name=$1
fi

# 電流と位置の振幅を計算する
i_max=$(cat ${result_file_name}| awk 'BEGIN{m=-1000000}{if(m<$2) m=$2} END{print m}')
echo "i_max":  $i_max
i_min=$(cat ${result_file_name}| awk 'BEGIN{m=1000000}{if(m>$2) m=$2} END{print m}')
echo "i_min":  $i_min
omega_max=$(cat ${result_file_name}| awk 'BEGIN{m=-1000000}{if(m<$3) m=$3} END{print m}')
echo "omega_max":  $omega_max
omega_min=$(cat ${result_file_name}| awk 'BEGIN{m=1000000}{if(m>$3) m=$3} END{print m}')
echo "omega_min":  $omega_min
echo "i_length: " + $(echo "($i_max - $i_min) * 0.5" | bc )
echo "omega_length: " + $(echo "($omega_max - $omega_min) * 0.5" | bc )

# 結果をgnuplotで出力する。
output_file_name=$(echo ${result_file_name} | sed 's/.data/.pdf/g')
column_num=$(head  -1 ${result_file_name} | awk '{printf("%s",NF)}')
if [ $column_num -eq 4 ]; then
	cat << EOF > gnuplot
plot "${result_file_name}" u 1:3 every 10 w l title "current [A]"
replot "${result_file_name}" u 1:4 every 10 w l title "position [rad]"
set ylabel "current[A]/position[rad]"
EOF
else
	cat << EOF > gnuplot
plot "${result_file_name}" u 1:2 every 10 w l title "current [A]"
replot "${result_file_name}" u 1:3 every 10 w l title  "angular velocity [rad/s]"
set ylabel "current[A]/angular velocity[rad/s]"
EOF
fi
cat << EOF >> gnuplot
set tics font "Helvetica,19"
set xlabel font "Helvetica,19"
set ylabel font "Helvetica,19"
set key font "Helvetica,19"
set grid
set xlabel "time[s]"
replot
set terminal pdfcairo
set lmargin 10
set rmargin 4
set tmargin 3
set bmargin 5
set output "${output_file_name}"
replot
unset output
EOF
cat gnuplot | gnuplot
