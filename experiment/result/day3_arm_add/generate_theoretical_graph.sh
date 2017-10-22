#!bin/bash

for file in result_200_2_dist_Tq_20; do
    tr=$(echo $file | sed "s/.data//" | awk -F '[_]' '{print $2}')
    zt=$(echo $file | sed "s/.data//" | awk -F '[_]' '{print $3}')
    tq=$(echo $file | sed "s/.data//" | awk -F '[_]' '{print $6}')
    cat <<EOF | octave ../../script/PDmotor.m
$tr
$zt
EOF
    output_name=$(echo $file | sed "s/.data/_theory_pd.pdf/")
    mv file.pdf ${output_name}
    
    cat <<EOF | octave ../../script/DTob2.m
$tr
$zt
$tq
EOF
    output_name=$(echo $file | sed "s/.data/_theory_dist.pdf/")
    mv file.pdf ${output_name}
done
