import os


finames = ['CRCtx021','CRCtx022', 'CRCtx023', 'CRCtx024', 'CRCtx025', 'CRCtx027', 'CRCtx028', 
           'CRCtx029', 'CRCtx030', 'CRCtx031', 'CRCtx032', 'CRCtx033', 'CRCtx034', 'CRCtx035',
           'CRCtx036', 'CRCtx037', 'CRCtx039', 'CRCtx040','CRCtx046', 'CRCtx047', 'CRCtx050', 
           'CRCtx053', 'CRCtx054', 'CRCtx055']
chrom = {'ENCFF997VIZ' :'H3K4me1', 'ENCFF816TDF' :'CTCF', 'ENCFF090EKJ' :'H3K36ME3', 
         'ENCFF976VVU' :'POLR2A', 'ENCFF150JBJ' :'H3K9ME3', 'ENCFF093NJN' :'EP300',
         'ENCFF612HRT' :'H3K27ME3', 'ENCFF959PXE' :'H3K27AC', 'ENCFF219ZIO' :'H3K4ME3',
         'ENCFF469WCM' :'ATAC'}

for j in chrom:
    bif = j+'.bigWig'
    for i in finames:
        samp = i+'.bed'
        ofile = chrom[j]+'_'+j+'_'+i+'.mat'
        figfile = chrom[j]+'_'+j+'_'+i+'.pdf'
        cmd1 = 'computeMatrix scale-regions -p max -a 500 -b 500 -R /home/projects/ku_00152/data/CRC/eccDNA_Revised/Samplewise_bedfiles/%s -S /home/projects/ku_00152/data/CRC/Chromatinstates/Bigwigs/%s -o /home/projects/ku_00152/data/CRC/Chromatinstates/heatmaps/%s' %(samp, bif, ofile)
        cmd2 = 'plotHeatmap -m /home/projects/ku_00152/data/CRC/Chromatinstates/heatmaps/%s -o /home/projects/ku_00152/data/CRC/Chromatinstates/heatmaps/%s' %(ofile, figfile)
        print (cmd1)
        os.system(cmd1)
        print (cmd2)
        os.system(cmd2)