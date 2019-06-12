#!/bin/bash
nohup sh alignment_1.sh
nohup sh alignment_2.sh
nohup sh alignment_3.sh
nohup sh merge.sh
Rscript plink_sh.R
