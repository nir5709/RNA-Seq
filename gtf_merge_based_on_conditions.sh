# Define paths
ASSEMBLY_DIR=/path/to/assembly
ANNOTATION_GTF= /path/to/gencode.v47.annotation.gtf

# Create file lists for control and disease GTFs
ls $ASSEMBLY_DIR/control/*.gtf > $ASSEMBLY_DIR/control_mergelist.txt
ls $ASSEMBLY_DIR/disease/*.gtf > $ASSEMBLY_DIR/disease_mergelist.txt

# Merge control GTFs
stringtie --merge -p 8 -G $ANNOTATION_GTF -o $ASSEMBLY_DIR/merged_control.gtf $ASSEMBLY_DIR/control_mergelist.txt

# Merge disease GTFs
stringtie --merge -p 8 -G $ANNOTATION_GTF -o $ASSEMBLY_DIR/merged_disease.gtf $ASSEMBLY_DIR/disease_mergelist.txt


