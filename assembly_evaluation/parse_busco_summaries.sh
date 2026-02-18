#!/bin/bash

OUTPUT_DIR="busco_results"
SUMMARY="${OUTPUT_DIR}/BUSCO_summary.tsv"

# Initialize summary file
echo -e "Accession\tC\tS\tD\tF\tM\tn" > "$SUMMARY"

# Loop through all BUSCO output folders
for dir in "$OUTPUT_DIR"/*_BUSCO; do
    acc=$(basename "$dir" | sed 's/_BUSCO//')
    summary_file=$(find "$dir" -type f -name "short_summary*.txt" | head -n 1)

    if [[ -f "$summary_file" ]]; then
        line=$(grep "C:" "$summary_file" | tr -d '[:space:]')
        if [[ $line =~ C:([0-9\.]+)%\[S:([0-9\.]+)%,D:([0-9\.]+)%\],F:([0-9\.]+)%,M:([0-9\.]+)%,n:([0-9]+) ]]; then
            C=${BASH_REMATCH[1]}
            S=${BASH_REMATCH[2]}
            D=${BASH_REMATCH[3]}
            F=${BASH_REMATCH[4]}
            M=${BASH_REMATCH[5]}
            n=${BASH_REMATCH[6]}
            echo -e "${acc}\t${C}\t${S}\t${D}\t${F}\t${M}\t${n}" >> "$SUMMARY"
        else
            echo -e "${acc}\tError parsing summary" >> "$SUMMARY"
        fi
    else
        echo -e "${acc}\tSummary file not found" >> "$SUMMARY"
    fi
done

echo "Summary TSV saved to $SUMMARY"
