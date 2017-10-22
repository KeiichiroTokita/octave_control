#!bin/bash

for folder in $(ls -l | grep "^d" | awk '{print $9}'); do
    cd $folder
    if [ -e "generate_theoretical_graph.sh" ]; then
	bash -x generate_theoretical_graph.sh
    fi
    cd ../
done
