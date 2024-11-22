library(survminer)
library(survival)

df = read.csv('S:/SCIENCE-BIO-BRSDriveCircularVision/Judith/Projects/CRC/Clinical/Clinical_timeframe2_totaleccDNA.tsv',sep='\t')
head(df)
ggsurvplot(KM, 
           data = df, 
           palette = c('#d8b365','#5ab4ac'),
           pval = TRUE,
           font.main = c(10, "bold", "black"),
           font.x = c(12,  "black"),
           font.y = c(12, "black"),
           xlim = c(0, 3000), break.time.by = 1000,  
           font.tickslab = c(12, "plain", "black"),
           mark.time=TRUE, 
           title = 'Colorectal cancer',
           ylab = 'Overall survival probability', 
           xlab = "Time in days",
           risk.table = "abs_pct",  # absolute number and percentage at risk.
           risk.table.y.text.col = T,
           risk.table.fontsize = 4,
           risk.table.y.text = FALSE,
)


KMpf<- survfit(Surv(df$Days.to.Recurrence.PD,df$Recurrence.PD.Event) ~ as.factor(df$eccDNA_ttotal_score), data =df)
pdf('S:/SCIENCE-BIO-BRSDriveCircularVision/Judith/Projects/CRC/Clinical/Figures/total_eccDNA_intumor.pdf', width = 5, height = 7,onefile=FALSE)
ggsurvplot(KMpf, 
           data = df, 
           pval = TRUE,font.main = c(10, "bold", "black"),
           font.x = c(12,  "black"),
           font.y = c(12, "black"),
           xlim=c(0,2800),
           break.time.by = 400,
           font.tickslab = c(12, "plain", "black"),
           palette = c('#CC0033','#330099'),
           mark.time=TRUE, 
           title = 'Colorectal cancer',
           ylab = 'Recurrence free survival probability', 
           xlab = "Time in days", 
           risk.table = "abs_pct",  # absolute number and percentage at risk.
           risk.table.y.text.col = T,risk.table.fontsize = 4,
           risk.table.y.text = FALSE)
dev.off()
