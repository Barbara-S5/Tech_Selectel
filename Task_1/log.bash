#!/bin/bash

awk '{sum[$1]+=$10} END {for (ip in sum) printf "%s bytes for %s\n", sum[ip], ip}' access.log | sort -rn
