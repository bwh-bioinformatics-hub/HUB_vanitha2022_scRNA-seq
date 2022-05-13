PREFIX="/Volumes/bioinformatics/projects/vanitha2022_combined/data/expectedCells/"
SUFFIX="/outs/filtered_feature_bc_matrix"
OUTS="/Volumes/bioinformatics/projects/vanitha2022_combined/output/scrublet/"
SAMPLES=("w3merged")

~/anaconda3/bin/python scrublet_multi.py $PREFIX $SUFFIX $OUTS "${SAMPLES[@]}"
