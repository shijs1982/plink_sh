#!/bin/bash
nohup sh alignment_1.sh > out_alignment_1.txt 2>&1 &
nohup sh alignment_2.sh > out_alignment_2.txt 2>&1 &
nohup sh alignment_3.sh > out_alignment_3.txt 2>&1 &
nohup sh merge.sh > out_merge.txt 2>&1 &
nohup sh phasing.sh > out_phasing.txt 2>&1 &
nohup bash imputation.sh > out_imputation.txt 2>&1 &