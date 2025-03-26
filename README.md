TITLE: - Role of lncrna in neurodegenerative disease

Project Description
This project focuses on the role of lncrna in neurodegenerative disease, specifically in Alzheimer's Disease. The dataset used in this study comes from the dorsolateral prefrontal cortex (DLPFC), one of the first cortical regions affected in AD. This region experiences significant synaptic loss, neurofibrillary tangles (NFTs), and amyloid-β (Aβ) accumulation, which are associated with early cognitive impairments.

Dataset Details`
Disease: - Alzheimer's Disease
GEO ID: - GSE53697 (Public on Feb 17, 2016)
Title: - RNAseq in Alzheimer's Disease Patients
Experiment Type: - Expression profiling by high-throughput sequencing
Summary: - Human brain samples from control and advanced Alzheimer's Disease patients were subjected to RNAseq analysis to monitor RNA level changes during AD progression.
Samples: -
  - GSM1885080 - RNAseq_Ctrl_1
  - GSM1885081 - RNAseq_Ctrl_2
  - GSM1885082 - RNAseq_Ctrl_3
  - GSM1885083 - RNAseq_Ctrl_4
  - GSM1885084 - RNAseq_Ctrl_5
  - GSM1885085 - RNAseq_Ctrl_6
  - GSM1885086 - RNAseq_Ctrl_7
  - GSM1885087 - RNAseq_Ctrl_8
  - GSM1885088 - RNAseq_AD_9
  - GSM1885089 - RNAseq_AD_10
  - GSM1885090 - RNAseq_AD_11
  - GSM1885091 - RNAseq_AD_12
  - GSM1885092 - RNAseq_AD_13
  - GSM1885093 - RNAseq_AD_14
  - GSM1885094 - RNAseq_AD_15
  - GSM1885095 - RNAseq_AD_16
  - GSM1885096 - RNAseq_AD_17
Pipeline Overview
1. Data Download
Bash script to download and convert SRR files using `prefetch` and `fasterq-dump`.
2. Preprocessing
Files were split using `fastq-dump` and quality checked using FastQC.
3. Alignment
STAR alignment is performed with 16 cores. BAM files are sorted and indexed using samtools.
4. Transcript Assembly
StringTie is used for transcript assembly per sample. Assemblies are merged for control and disease samples.
5. GTF Merging
Scripts merge GTF files either into a single merged file or separately for control and disease.
6. GFFCompare Analysis
GFFCompare is run to annotate merged transcripts and extract novel lncRNAs.
7. lncRNA Identification
FEELnc is used to filter and predict coding potential for novel lncRNAs.
8. Quantification
The Salmon pipeline is used to create a decoy-aware index and quantify expression for control and disease samples.

