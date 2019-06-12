#!/bin/bash

unset dic_hg19
declare -A dic_hg19
while read line
do
  name=`echo "$line" | awk '{print $1}'`
  value=`echo "$line" | awk '{print $2}'`
  dic_hg19+=(["$name"]="$value")
  echo $name:$value
done < hg19_chr_length.txt 


for i in $(seq 1 1)
do
    echo chr"$i" length: "${dic_hg19[chr"$i"]}"
    num_chunk=0
    for((j=1;j<="${dic_hg19[chr"$i"]}";j=j+5000000))
    do
        k=$(("$j"+5000000-1))
        num_chunk=$(("$num_chunk"+1))
        echo i: "$i" j: "$j" k: "$k"
        impute2 -use_prephased_g -Ne 20000 -iter 30 -align_by_maf_g -os 0 1 2 3 -seed 1000000 -o_gz \
        -int "$j" "$k" \
        -h /home/sjs/resources/1000GP_Phase3/1000GP_Phase3_chr"$i".hap.gz \
        -l /home/sjs/resources/1000GP_Phase3/1000GP_Phase3_chr"$i".legend.gz \
        -m /home/sjs/resources/1000GP_Phase3/genetic_map_chr"$i"_combined_b37.txt \
        -known_haps_g ./chr"$i"/phased_chr"$i".haps -o ./chr"$i"/chr"$i".chunk"$num_chunk"
    done
    find ./chr"$i"/ -name '.*chunk\[0-9][0-9]*.gz' -print0 | xargs -0 -i cat {} >> ./chr"$i"/chr"$i"_chunkAll.gen.gz


done

find ./chr1/ -regex '.*aligned_[0-9][0-9]*.*' -print0 | xargs -0 ls {}