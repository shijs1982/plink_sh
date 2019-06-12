!/usr/bin/bash
all_chrs_1=32s_aligned
all_chrs_2=72s_aligned
all_chrs_3=gwas_aligned
for i in  $(seq 1 22)
do 
    plink --bfile chr${i}/${all_chrs_1}_${i} --bmerge chr${i}/${all_chrs_2}_${i}.bed chr${i}/${all_chrs_2}_${i}.bim chr${i}/${all_chrs_2}_${i}.fam --make-bed --out chr${i}/merge_a_${i}
    plink --bfile chr${i}/merge_a_${i} --bmerge chr${i}/${all_chrs_3}_${i}.bed chr${i}/${all_chrs_3}_${i}.bim chr${i}/${all_chrs_3}_${i}.fam --make-bed --out chr${i}/merge_b_${i}

done