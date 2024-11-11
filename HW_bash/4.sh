#!/bin/bash

hello() {
	result="Hello $1"
	echo $result
}

sum() {
	result=$(($1 + $2))
	echo $result
}

hello_res=$(hello "world")
echo $hello_res

sum_res=$(sum 1 2)
echo $sum_res
