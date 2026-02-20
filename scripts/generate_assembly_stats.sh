#!/bin/bash

GENOME_DIR="genomes_raw"
BUSCO_SUMMARY="assembly_evaluation/BUSCO_summary.tsv"
OUTPUT="assembly_evaluation/assembly_stats.tsv"

# Header
echo -e "Accession\tContigs\tTotal_Length\tN50\tC\tS\tD\tF\tM\tn" > "$OUTPUT"

for genome in "$GENOME_DIR"/*.fna; do
    acc=$(basename "$genome" | cut -d "_" -f1,2)

    # Get contig lengths
    lengths=$(awk '
        /^>/ {if (seqlen) print seqlen; seqlen=0; next}
        {seqlen += length($0)}
        END {print seqlen}
    ' "$genome")

    contigs=$(echo "$lengths" | wc -l | tr -d ' ')
    total=$(echo "$lengths" | awk '{sum+=$1} END {print sum}')

    # Calculate N50
    N50=$(echo "$lengths" | sort -nr | awk -v total="$total" '
        {sum+=$1; if (sum >= total/2) {print $1; exit}}
    ')

    # Get BUSCO stats
    busco_line=$(grep "$acc" "$BUSCO_SUMMARY")

    if [[ -n "$busco_line" ]]; then
        C=$(echo "$busco_line" | cut -f2)
        S=$(echo "$busco_line" | cut -f3)
        D=$(echo "$busco_line" | cut -f4)
        F=$(echo "$busco_line" | cut -f5)
        M=$(echo "$busco_line" | cut -f6)
        n=$(echo "$busco_line" | cut -f7)
    else
        C="NA"; S="NA"; D="NA"; F="NA"; M="NA"; n="NA"
    fi

    echo -e "${acc}\t${contigs}\t${total}\t${N50}\t${C}\t${S}\t${D}\t${F}\t${M}\t${n}" >> "$OUTPUT"

done

echo "Assembly statistics saved to $OUTPUT"
