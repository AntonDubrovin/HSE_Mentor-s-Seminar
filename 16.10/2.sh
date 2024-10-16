#!/bin/bash

read -p "Введите первое число: " FIRST
read -p "Введите второе число: " SECOND

if [ $FIRST -gt $SECOND ]; then
	echo "$FIRST > $SECOND"
elif [ $FIRST -lt $SECOND ]; then
	echo "$SECOND < $SECOND"
else
	echo "$FIRST = $SECOND"
fi
