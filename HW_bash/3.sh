#!/bin/bash

read -p "Введите число " number

if [ $number -gt 0 ]; then
	echo "Число больше нуля"
	for  ((i=1; i<=$number; i++)); do
		echo $i
	done
elif [ $number -lt 0 ]; then
	echo "Число меньше нуля"
else
	echo "Число равно нулю"
fi


