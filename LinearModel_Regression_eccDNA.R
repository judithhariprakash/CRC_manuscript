efile <- read.csv('S:/SCI-BIO-BRSDriveCircularVision/Judith/Projects/CRC/Clinical/eccDNAwithclinical.tsv',sep='\t')
head (efile)
library(survminer)
library(survival)

m2 <-lm(efile$ecDNA_TT ~ efile$Age + as.factor(efile$Sex) + as.factor(efile$Stage) + as.factor(efile$Tumor.location), data=efile )
summary(m2)
