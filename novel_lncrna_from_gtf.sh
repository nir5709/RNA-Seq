# class code indicate novel, not matching any exon/intron
grep 'class_code "u"' $GFFCOMPARE_OUTPUT_DIR/gffcompare_control.annotated.gtf > $ASSEMBLY_DIR/novel_lncRNAs_control.gtf
grep 'class_code "u"' $GFFCOMPARE_OUTPUT_DIR/gffcompare_disease.annotated.gtf > $ASSEMBLY_DIR/novel_lncRNAs_disease.gtf


