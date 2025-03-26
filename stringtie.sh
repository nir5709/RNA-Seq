#!/bin/bash

# Set the base directory
BASE_DIR= /path/to/SRRfiles/directory/
GENOME_DIR="$BASE_DIR/47_index"
FASTQ_DIR="$BASE_DIR"
ALIGN_DIR="$BASE_DIR/alignments"
CONTROL_DIR="$ALIGN_DIR/control"
DISEASE_DIR="$ALIGN_DIR/disease"

# Assembly directory for transcript assembly
ASSEMBLY_DIR="$BASE_DIR/assembly"
ANNOTATION_FILE="$BASE_DIR/gencode.v47.annotation.gtf"  # Change this if needed

# Define control and disease sample lists
CONTROL_SAMPLES=("SRR2422918" "SRR2422919" "SRR2422920" "SRR2422921" "SRR2422922" "SRR2422923" "SRR2422924" "SRR2422925")
DISEASE_SAMPLES=("SRR2422926" "SRR2422927" "SRR2422928" "SRR2422929" "SRR2422930" "SRR2422931" "SRR2422932" "SRR2422933" "SRR2422934")

# Create necessary directories
mkdir -p $ASSEMBLY_DIR/control $ASSEMBLY_DIR/disease

# Check if annotation file exists before running
if [ ! -f "$ANNOTATION_FILE" ]; then
    echo "❌ Error: Reference annotation file ($ANNOTATION_FILE) not found. Exiting..."
    exit 1
fi

# Run StringTie for Control Samples
for SAMPLE in "${CONTROL_SAMPLES[@]}"; do
    echo "Running StringTie on Control Sample: $SAMPLE"
    
    stringtie $CONTROL_DIR/${SAMPLE}_Aligned.sortedByCoord.out.bam \
        -p 8 \
        -G $ANNOTATION_FILE \
        -o $ASSEMBLY_DIR/control/${SAMPLE}.gtf
done

# Run StringTie for Disease Samples
for SAMPLE in "${DISEASE_SAMPLES[@]}"; do
    echo "Running StringTie on Disease Sample: $SAMPLE"
    
    stringtie $DISEASE_DIR/${SAMPLE}_Aligned.sortedByCoord.out.bam \
        -p 8 \
        -G $ANNOTATION_FILE \
        -o $ASSEMBLY_DIR/disease/${SAMPLE}.gtf
done

echo "✅ StringTie Transcript Assembly Completed!"


