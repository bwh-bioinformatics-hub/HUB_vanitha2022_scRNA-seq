#!/bin/sh

# title: script for single-cell data analysis
# author: Tingting Zhao
# email: tzhao7@bwh.harvard.edu
# date: "02/05/2022"
# usage: source scRNA_seq.sh
# platform: BHW ERISone
# folder structure: project folder (data, output, result, scr)

# bash setting
#index_file="/data/bioinformatics/projects/hassan2022/data/FC_07189/220118_A01061_0232_BH72NCDMXY/BPF_library_Feany_lab_mod.csv"
#reference_folder="/data/bioinformatics/referenceGenome/Drosophila_Melanogaster/Ensembl/dm6/Drosophila_melanogaster.genome"
project_folder="/data/bioinformatics/projects/vanitha2022_combined/"
data_folder="/data/bioinformatics/projects/vanitha2022_combined/data/"
#baseSpace_ID =
#bcl_files="/data/bioinformatics/projects/hassan2022/data/FC_07189/220118_A01061_0232_BH72NCDMXY"
expect_cells=10000
#fastq_folder="01_cellranger_mkfastq"
countTable_folder="expectedCells"

# R setting
pwd="/data/bioinformatics/projects/vanitha2022_combined/scr/"
indir="/data/bioinformatics/projects/vanitha2022_combined/data/expectedCells/"
outdir="/data/bioinformatics/projects/vanitha2022_combined/output/"
scrubletdir="/data/bioinformatics/projects/vanitha2022_combined/output/scrublet/"
samples="CRN00224921,CRN00224922,CRN00224923,CRN00224924,CRN00224926,w3merged"
treatments="mutant,control,control,mutant,mutant,control"
projectName="vanitha2022combined"
marker_link="https://docs.google.com/spreadsheets/d/1gCzAeVe9Ekpyt8XdNOyBrOcw7Letr-WTpBh4-37ySpA/edit#gid=446579886"
marker_sheet="MarkerGenesFiltered"
flag=1 #Options for cell clustering algorithm, 1=louvain, 2=GLMPCA, 3= leiden, 0=louvain and GLMPCA and leiden
mtPattern="^mt:"
rbPattern="^Rp[LS]"
mitoCutoff=10


# load modules
#conda init /PHShome/tz949/anaconda3/envs/scrnaseq
conda activate scrnaseq
module load cellranger/6.0 # there is only version 3 under conda

# step1: download data from BaseSpace
#bs download run -i $baseSpace_ID -o $data_folder

# step2: bcl to fastq
#cd $project_folder/output
#bsub -q big cellranger mkfastq --id =$fastq_folder \
#                   --run =$bcl_files \
#                   --csv =$index_file

# step3: making count table
#cd $project_folder/output/$countTable_folder
#for i in $(cat $index_file | awk -F "," '(NR>1){print $2}'); do
#bsub -q big cellranger count --id = $i \
#--transcriptome = $reference_folder \
#--fastqs =$project_folder/output/$fastq_folder/outs/fastq_path/ \
#--sample =$i \
#--expect-cells =$expect_cells \
#--include-introns
#done

# step4: running Seurat on individual samples
bsub -q big -e seurat_individual.log Rscript seurat_individual.R $pwd $indir $outdir $scrubletdir $samples $projectName $marker_link $marker_sheet $flag $mtPattern $rbPattern $mitoCutoff
