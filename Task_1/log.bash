#!/bin/bash

awk '$10 ~ /^[0-9]+$/ {sum[$1]+=$10} END {for (ip in sum) if (sum[ip] >= 0) printf "%s bytes for %s\n", sum[ip], ip}' access.log | sort -bn
