#!bin/bash

for folder in $(ls -l result/ | grep "^d" | awk '{print $9}'); do
    for file in $(ls result/$folder/ | grep ".data$"); do
	bash plot.sh result/$folder/$file
    done
done
