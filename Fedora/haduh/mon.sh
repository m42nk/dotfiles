#!/bin/env bash

# get percentage of ram and cpu usage

MEM="$(free -t | awk 'FNR == 2 {printf("%.2f%"), $3/$2*100}')"
USG="$(mpstat 1 1 | awk 'END{print 100-$NF"%"}')"
STO="$(df -h | awk 'FNR==4 {printf "%s/%s", $3,$2}')"

echo "M: $MEM | C: $USG | S: $STO"
