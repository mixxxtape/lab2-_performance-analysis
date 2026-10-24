#!/bin/bash
# Використання: ./run.sh ./lab2_O0 5
PROG=$1; REPS=${2:-5}
nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits -lms 500 > gpu_tmp.log 2>/dev/null &
GPID=$!
START=$(date +%s.%N)
for i in $(seq $REPS); do $PROG 4000 1000 1e-10 0 > /dev/null; done
END=$(date +%s.%N)
kill $GPID 2>/dev/null
echo "Час: $(echo "$END - $START" | bc) с (запусків: $REPS)"
echo "Середня потужність GPU: $(awk '{s+=$1;n++} END{if(n) printf "%.1f", s/n; else print "н/д"}' gpu_tmp.log) Вт"
rm -f gpu_tmp.log
