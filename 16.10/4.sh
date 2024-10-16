#!/bin/bash

read -p "Введите сайт для пинга: " SITE

ping -c 1 $SITE | head -n0

if [ $? -eq 0 ]; then
	echo "success"
else
	echo "error"
fi
