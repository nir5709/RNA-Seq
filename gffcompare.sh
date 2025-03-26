#!/bin/bash

# Set directories
BASE_DIR= path/to/base/dir/SRRfiles/one
ASSEMBLY_DIR="$BASE_DIR/assembly"
ANNOTATION_FILE="$BASE_DIR/gencode.v47.annotation.gtf"
CONTROL_GTF="$ASSEMBLY_DIR/merged_control.gtf"
DISEASE_GTF="$ASSEMBLY_DIR/merged_disease.gtf"
GFFCOMPARE_OUTPUT_DIR="$ASSEMBLY_DIR/gffcompare_output"

# Create output directory
mkdir -p $GFFCOMPARE_OUTPUT_DIR

# Check if required files exist
if [ ! -f "$ANNOTATION_FILE" ]; then
    echo "❌ Error: Reference annotation file ($ANNOTATION_FILE) not found. Exiting..."
    exit 1
fi

if [ ! -f "$CONTROL_GTF" ]; then
    echo "❌ Error: Merged control GTF file ($CONTROL_GTF) not found. Exiting..."
    exit 1
fi

if [ ! -f "$DISEASE_GTF" ]; then
    echo "❌ Error: Merged disease GTF file ($DISEASE_GTF) not found. Exiting..."
    exit 1
fi

# Run GFFCompare for Control GTF
echo "🔍 Running GFFCompare for Control samples..."
gffcompare -r "$ANNOTATION_FILE" -R -M -o "$GFFCOMPARE_OUTPUT_DIR/gffcompare_control" "$CONTROL_GTF"
echo "✅ GFFCompare Analysis Completed for Control samples!"

# Run GFFCompare for Disease GTF
echo "🔍 Running GFFCompare for Disease samples..."
gffcompare -r "$ANNOTATION_FILE" -R -M -o "$GFFCOMPARE_OUTPUT_DIR/gffcompare_disease" "$DISEASE_GTF"
echo "✅ GFFCompare Analysis Completed for Disease samples!"

echo "✅ All GFFCompare analyses are completed!"
echo "Results are in: $GFFCOMPARE_OUTPUT_DIR"


