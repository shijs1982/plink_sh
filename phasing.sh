#!/bin/bash

for i in $(seq 1 22)
do
    mkdir chr"$i"

    shapeit -B ./chr"$i"/merge_b_"$i" -M ~/resources/1000GP_Phase3/genetic_map_chr"$i"_combined_b37.txt -O ./chr"$i"/phased_chr"$i" -T 10

    echo "phased_chr$i generated!"
done