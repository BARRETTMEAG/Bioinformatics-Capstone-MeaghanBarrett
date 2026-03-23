#!/bin/bash

PROJECT= <Location of your project insert here>
ANNOTATION_DIR="$PROJECT/genomes_annotated"
OUTPUT="$ANNOTATION_DIR/genome_summary.tsv"

echo -e "Genome\tLength\tGC\tCodingDensity\tCDS\tHypotheticals\tPercentHypothetical\ttRNA\trRNA\tCRISPR" > "$OUTPUT"

for summary in $ANNOTATION_DIR/*/*.txt
do
    genome=$(basename "$summary" .txt)

    length=$(grep "Length:" "$summary" | awk '{print $2}')
    gc=$(grep "^GC:" "$summary" | awk '{print $2}')
    coding=$(grep "coding density:" "$summary" | awk '{print $3}')
    cds=$(grep "^CDSs:" "$summary" | awk '{print $2}')
    hypotheticals=$(grep "^hypotheticals:" "$summary" | awk '{print $2}')
    trna=$(grep "^tRNAs:" "$summary" | awk '{print $2}')
    rrna=$(grep "^rRNAs:" "$summary" | awk '{print $2}')
    crispr=$(grep "^CRISPR arrays:" "$summary" | awk '{print $3}')

    # Calculate % hypothetical
    percent_hypo=$(awk "BEGIN {printf \"%.2f\", ($hypotheticals/$cds)*100}")

    echo -e "${genome}\t${length}\t${gc}\t${coding}\t${cds}\t${hypotheticals}\t${percent_hypo}\t${trna}\t${rrna}\t${crispr}" >> "$OUTPUT"

done

echo "Summary file created at: $OUTPUT"
