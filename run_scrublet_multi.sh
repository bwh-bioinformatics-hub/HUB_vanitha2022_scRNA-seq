PREFIX="/Volumes/bioinformatics/projects/vanitha2022_combined/data/expectedCells/"
SUFFIX="/outs/filtered_feature_bc_matrix"
OUTS="/Volumes/bioinformatics/projects/vanitha2022_combined/output/scrublet/"
#SAMPLES=("QTau-2")
SAMPLES=("w3merged")

~/anaconda3/bin/python scrublet_multi.py $PREFIX $SUFFIX $OUTS "${SAMPLES[@]}" # if run scripts on server
#/Users/tingtingzhao/anaconda3/bin/python3 scrublet_multi.py $PREFIX $SUFFIX $OUTS "${SAMPLES[@]}"

# "QTau-2" causes a problem for running the script
