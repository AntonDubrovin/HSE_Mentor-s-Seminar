#!/bin/bash
set -m

sleep 5 &
sleep 10 &
sleep 1 &

jobs

fg %3

jobs

