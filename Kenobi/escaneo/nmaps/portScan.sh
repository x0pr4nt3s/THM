#!/bin/bash

# script para mapear los puertos de una ip especifica

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n[*]Exiting....\n"
	exit 0
}


tput civis;for port in $(seq 1 65000);do
	timeout 1 bash -c "echo ''< /dev/tcp/10.10.75.192/$port" 2>/dev/null && echo "Port $port - OPEN" &
done;wait
tput cnorm

