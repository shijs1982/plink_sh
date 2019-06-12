import os

os.system('ls')

#os.system('java -Xmx40g -jar ~/programs/GenotypeHarmonizer/GenotypeHarmonizer.jar --inputType PLINK_BED --input gwas --update-id --outputType PLINK_BED --output alignment/gwas --refType PLINK_BED --ref ~/resources/all_phase3/all_phase3')
#os.system('java -Xmx40g -jar ~/programs/GenotypeHarmonizer/GenotypeHarmonizer.jar --inputType PLINK_BED --input DN_zhonghua8_104s --update-id --outputType PLINK_BED --output alignment/DN_zhonghua8_104s --refType PLINK_BED --ref ~/resources/all_phase3/all_phase3')

os.system('sh alignment_1.sh')
os.system('sh alignment_2.sh')
os.system('nohup sh alignment_3.sh')
os.system('sh merge.sh')


