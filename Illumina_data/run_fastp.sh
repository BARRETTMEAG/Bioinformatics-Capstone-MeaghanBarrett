#!/bin/bash

# Make sure your bioinfo conda environment is active
# conda activate bioinfo

TRIMMED_DIR="./qc/trimmed_reads"
REPORT_DIR="./qc/reports"
MULTIQC_DIR="./qc/multiqc_report"

mkdir -p "$TRIMMED_DIR" "$REPORT_DIR" "$MULTIQC_DIR"

# ---------------------------
# Loop over all R1 files
# ---------------------------
for R1 in *_R1_001.fastq.gz; do
    sample="${R1%_R1_001.fastq.gz}"
    R2="${sample}_R2_001.fastq.gz"

    if [[ -f "$R2" ]]; then
        echo "Processing paired-end sample: $sample"
        fastp -i "$R1" -I "$R2" \
              -o "$TRIMMED_DIR/${sample}_R1_trimmed.fastq.gz" \
              -O "$TRIMMED_DIR/${sample}_R2_trimmed.fastq.gz" \
              -h "$REPORT_DIR/${sample}_fastp.html" \
              -j "$REPORT_DIR/${sample}_fastp.json" \
              -q 20 -l 50 -w 4
    else
        echo "Processing single-end sample: $sample"
        fastp -i "$R1" \
              -o "$TRIMMED_DIR/${sample}_trimmed.fastq.gz" \
              -h "$REPORT_DIR/${sample}_fastp.html" \
              -j "$REPORT_DIR/${sample}_fastp.json" \
              -q 20 -l 50 -w 4
    fi
done

echo "All samples processed!"

# ---------------------------
# MultiQC
# ---------------------------
multiqc "$REPORT_DIR" -o "$MULTIQC_DIR"
echo "MultiQC report generated at $MULTIQC_DIR/multiqc_report.html"

# ---------------------------
# Verify outputs
# ---------------------------
echo "Verifying trimmed reads and QC reports..."
for sample in *_R1_001.fastq.gz; do
    sname="${sample%_R1_001.fastq.gz}"
    if [[ -f "$TRIMMED_DIR/${sname}_R1_trimmed.fastq.gz" ]]; then
        echo "✅ $sname R1 trimmed file exists"
    else
        echo "⚠️ $sname R1 trimmed file missing"
    fi

    if [[ -f "${sname}_R2_001.fastq.gz" ]]; then
        if [[ -f "$TRIMMED_DIR/${sname}_R2_trimmed.fastq.gz" ]]; then
            echo "✅ $sname R2 trimmed file exists"
        else
            echo "⚠️ $sname R2 trimmed file missing"
        fi
    fi

    if [[ -f "$REPORT_DIR/${sname}_fastp.json" ]]; then
        echo "✅ $sname JSON report exists"
    else
        echo "⚠️ $sname JSON report missing"
    fi

    if [[ -f "$REPORT_DIR/${sname}_fastp.html" ]]; then
        echo "✅ $sname HTML report exists"
    else
        echo "⚠️ $sname HTML report missing"
    fi
done

echo "QC pipeline complete!"


