#!/bin/bash

read -p "Введите название файла: " FILE
read -p "Введите слово для поиска: " WORD

echo $(grep -o "$WORD" "$FILE" | wc -l)
