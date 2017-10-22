#!bin/bash

for file in $(ls | grep "^\(result\).*\(.data\)$"); do
    tr=$(echo $file | sed "s/.data//" | awk -F '[_]' '{print $2}')
    zt=$(echo $file | sed "s/.data//" | awk -F '[_]' '{print $3}')
    cat <<EOF | octave ../../script/PDarm.m
$tr
$zt
EOF
    output_name=$(echo $file | sed "s/.data/_theory.pdf/")
    mv file.pdf ${output_name}
done
