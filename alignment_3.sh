#!/bin/bash
all_chrs=32s
for i in  $(seq 1 22)
do 
    mkdir chr${i}
    plink --bfile /home/sjs/R/gwas/gwas_DN/PLINK_32s/${all_chrs} --chr ${i} --make-bed --out chr${i}/${all_chrs}_${i} 
    java -Xmx40g -jar ~/programs/GenotypeHarmonizer/GenotypeHarmonizer.jar --inputType PLINK_BED --input chr${i}/${all_chrs}_${i} --update-id --outputType PLINK_BED --output chr${i}/${all_chrs}_aligned_${i} --refType VCF --ref ~/resources/phase3_1000g/1000gChr${i}
    echo "${all_chrs}_aligned_${i} generated!"
done