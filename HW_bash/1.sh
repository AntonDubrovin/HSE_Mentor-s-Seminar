#!/bin/bash

read -p "Введите название файла: " file

find . -maxdepth 1 -printf "File name=%f; file type=%y;\n"

if [ -f $file ]; then
	echo "Файл найден"
else
	echo "Файл не найден"
fi
