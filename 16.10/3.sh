#!/bin/bash

read -p "Введите количество символов для пароля: " N

echo $(openssl rand -base64 $N | tr -dc 'a-zA-Z0-9' | head -c $N)
