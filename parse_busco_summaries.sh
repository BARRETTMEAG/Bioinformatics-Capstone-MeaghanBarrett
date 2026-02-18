#!/bin/bash

OUTPUT_DIR="busco_results"
GENOME_DIR="genomes_raw"
SUMMARY="${OUTPUT_DIR}/BUSCO_summary.tsv"

# Initialize summary file with N50 column
echo -e "Accession\tC\tS\tD\tF\tM\tn\tN50" > "$SUMMARY"

# Loop through all BUSCO output folders
for dir in "$OUTPUT_DIR"/*_BUSCO; do
    acc=$(basename "$dir" | sed 's/_BUSCO//')
    summary_file=$(find "$dir" -type f -name "short_summary*.txt" | head -n 1)
    fasta_file=$(ls "$GENOME_DIR"/${acc}_*_genomic.fna 2>/dev/null)

    # Compute N50 using seqkit if available
    if [[ -f "$fasta_file" ]]; then
        if command -v seqkit >/dev/null 2>&1; then
            N50=$(seqkit stats -T -a "$fasta_file" | awk 'NR==2 {print $6}')
        else
            N50="seqkit_not_found"
        fi
    else
        N50="NA"
    fi

    # Parse BUSCO summary
    if [[ -f "$summary_file" ]]; then
        line=$(grep "C:" "$summary_file" | tr -d '[:space:]')
        if [[ $line =~ C:([0-9\.]+)%\[S:([0-9\.]+)%,D:([0-9\.]+)%\],F:([0-9\.]+)%,M:([0-9\.]+)%,n:([0-9]+) ]]; then
            C=${BASH_REMATCH[1]}
            S=${BASH_REMATCH[2]}
            D=${BASH_REMATCH[3]}
            F=${BASH_REMATCH[4]}
            M=${BASH_REMATCH[5]}
            n=${BASH_REMATCH[6]}
            echo -e "${acc}\t${C}\t${S}\t${D}\t${F}\t${M}\t${n}\t${N50}" >> "$SUMMARY"
        else
            echo -e "${acc}\tError parsing summary\t\t\t\t\t\t${N50}" >> "$SUMMARY"
        fi
    else
        echo -e "${acc}\tSummary file not found\t\t\t\t\t\t${N50}" >> "$SUMMARY"
    fi
done

echo "Summary TSV with N50 saved to $SUMMARY"
