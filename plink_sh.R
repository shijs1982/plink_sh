# fam文件补充性别和表型
DN_zhonghua8_104s_fam <- read.table("DN_zhonghua8_104s.fam",
    header = F, sep = " "
)
head(DN_zhonghua8_104s_fam)

clinical_rnaseq_DN <- read.csv("~/R/rnaseq/clinical/clinical_rnaseq_DN.csv")
clinical_rnaseq_DN <- clinical_rnaseq_DN[order(clinical_rnaseq_DN$StudyID), ]
clinical_rnaseq_DN$SEX[clinical_rnaseq_DN$SEX == 0] <- 2
head(clinical_rnaseq_DN)
write.table(clinical_rnaseq_DN[, c("StudyID", "StudyID")],
    "FI_II_rnaseq_DN.txt",
    sep = "	",
    quote = FALSE,
    row.names = FALSE,
    col.names = FALSE
)

DN_zhonghua8_104s_fam$V5 <- clinical_rnaseq_DN$SEX[
    match(DN_zhonghua8_104s_fam$V2, clinical_rnaseq_DN$MRID)
]
DN_zhonghua8_104s_fam$V1 <- clinical_rnaseq_DN$StudyID[
    match(DN_zhonghua8_104s_fam$V2, clinical_rnaseq_DN$MRID)
]
DN_zhonghua8_104s_fam$V2 <- clinical_rnaseq_DN$StudyID[
    match(DN_zhonghua8_104s_fam$V2, clinical_rnaseq_DN$MRID)
]
DN_zhonghua8_104s_fam$V6 <- 2
head(DN_zhonghua8_104s_fam)


write.table(DN_zhonghua8_104s_fam, "DN_zhonghua8_104s.fam",
    row.names = F, col.names = F, quote = F, sep = " "
)