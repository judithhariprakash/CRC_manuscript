library(Gviz)
library(GenomicRanges)
library(data.table)
library(Rsamtools)
setwd('S:/SCIENCE-BIO-BRSDriveCircularVision/Judith/Projects/CRC')
bf<- read.csv('S:/SCIENCE-BIO-BRSDriveCircularVision/Judith/Projects/CRC/Candidate/CXCL5.bed',sep='\t')
refGenes<-read.csv('S:/SCIENCE-BIO-BRSDriveCircularVision/Judith/Projects/Reference_genome/NM_gene.bed')

#ideogram to show the chromosome 
ideoTrack <- IdeogramTrack(genome = "hg38", chromosome = "chr4")

# genomic axis to show the scale of the figure
gtrack <- GenomeAxisTrack()

# From a bed file with eccDNA locus is used to plot the eccDNA
ptrack <- GeneRegionTrack(bf, genome = 'hg38', chromosome = 4, 
                          name = "eccDNA", lineheight = 0.5,  fill = "#256499",)

# Genes in the locus
grtrack <- GeneRegionTrack(refGenes, genome = 'hg38', chromosome = 4,name = "Genes", lineheight = 0.1,  fill = "#ece2f0")

options(ucscChromosomeNames=FALSE)
#Alignment from bam files
TumorTrack <- AlignmentsTrack(range='S:/SCIENCE-BIO-BRSDriveCircularVision/Judith/Projects/CRC/eccDNA/Circle-seq/TT028_chr1_22.bam', genome = 'hg38')
NormalTrack <- AlignmentsTrack(range='S:/SCIENCE-BIO-BRSDriveCircularVision/Egija_Zole/CRC_sample_sequences/BAM_files/CRCnx028/NN028.bam', genome = 'hg38')

pdf('')
plotTracks(list(ideoTrack, gtrack,  ptrack, TumorTrack,NormalTrack),from = 63930950, to = 74221695, transcriptAnnotation = "gene", 
           collapseTranscripts = "longest",type = "coverage", chromosome = 'chr4')

