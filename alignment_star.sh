
#!/bin/bash

# Set directories
BASE_DIR=/path/to/your/outputdir/where/split/SRR/files/exist
GENOME_DIR="$BASE_DIR/47_index"
FASTQ_DIR="$BASE_DIR"
ALIGN_DIR="$BASE_DIR/alignments"
CONTROL_DIR="$ALIGN_DIR/control"
DISEASE_DIR="$ALIGN_DIR/disease"

# Create necessary directories if not exist
mkdir -p $CONTROL_DIR $DISEASE_DIR

# Load STAR if required (Uncomment if needed)
# module load STAR

# Define control and disease sample lists
CONTROL_SAMPLES=("SRR2422918" "SRR2422919" "SRR2422920" "SRR2422921" "SRR2422922" "SRR2422923" "SRR2422924" "SRR2422925")
DISEASE_SAMPLES=("SRR2422926" "SRR2422927" "SRR2422928" "SRR2422929" "SRR2422930" "SRR2422931" "SRR2422932" "SRR2422933" "SRR2422934")

# Function to run STAR alignment
run_star_alignment() {
    SAMPLE=$1
    OUT_DIR=$2  # Control or Disease directory

    echo "Processing sample: $SAMPLE"

    STAR --runThreadN 16 \
         --genomeDir $GENOME_DIR \
         --readFilesIn $FASTQ_DIR/${SAMPLE}_1.fastq $FASTQ_DIR/${SAMPLE}_2.fastq \
         --outFileNamePrefix $OUT_DIR/${SAMPLE}_ \
         --outSAMtype BAM SortedByCoordinate \
         --readFilesCommand cat
    
    # Index the BAM file
    samtools index $OUT_DIR/${SAMPLE}_Aligned.sortedByCoord.out.bam
}

# Run STAR for control samples
for SAMPLE in "${CONTROL_SAMPLES[@]}"; do
    run_star_alignment "$SAMPLE" "$CONTROL_DIR"
done

# Run STAR for disease samples
for SAMPLE in "${DISEASE_SAMPLES[@]}"; do
    run_star_alignment "$SAMPLE" "$DISEASE_DIR"
done

echo "STAR alignment completed successfully!"





