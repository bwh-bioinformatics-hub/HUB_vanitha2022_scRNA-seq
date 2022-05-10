#!/bin/bash
conda activate scrnaseq
module load cellranger/6.0
cellranger count  --id=w3merged \
                  --transcriptome=/data/bioinformatics/referenceGenome/Drosophila_Melanogaster/Ensembl/dm6/Drosophila_melanogaster.genome \
                  --fastqs=/data/bioinformatics/projects/hassan2022/output/01_cellranger_mkfastq/outs/fastq_path/H72NCDMXY/,/data/bioinformatics/projects/rachel2022/output/01_cellranger_mkfastq/outs/fastq_path/H7KGTDMXY/ \
                  --sample=CRN00224925,w3 \
                  --expect-cells=10000

