#!/bin/bash
# merge_gtf.sh
# This script creates a list of all GTF files from the control and disease directories,
# then merges the assembled transcripts into a single annotation file using StringTie.

# Set the assembly directory and annotation file (adjust paths as needed)
ASSEMBLY_DIR= /path/to/assembly/
ANNOTATION_FILE= /path/to/your/gencode.v47.annotation.gtf

# Step 1: Create a single list of all GTF files from control and disease directories.
(ls "$ASSEMBLY_DIR/control/"*.gtf "$ASSEMBLY_DIR/disease/"*.gtf) > "$ASSEMBLY_DIR/mergelist.txt"

# Step 2: Merge all assembled transcripts into a single annotation file.
stringtie --merge -p 8 -G "$ANNOTATION_FILE" -o "$ASSEMBLY_DIR/merged.gtf" "$ASSEMBLY_DIR/mergelist.txt"

echo "✅ GTF files merged successfully!"


