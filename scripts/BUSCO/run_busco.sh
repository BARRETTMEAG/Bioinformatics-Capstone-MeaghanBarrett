#!/bin/bash

# ----------------------------
# run_busco.sh
# ----------------------------
# Run BUSCO v6 on multiple genome assemblies
# ----------------------------

GENOME_DIR="genomes_raw"
LINEAGE="bacteria_odb10"
CPU=4
OUTPUT_DIR="busco_results"

# List of accessions
ACCESSIONS=(
GCF_000171415.1
GCF_000171535.2
GCF_000007545.1
GCF_000020925.1
GCF_000170215.1
GCF_000170255.1
GCF_000171255.1
GCF_000171275.1
GCF_000171315.1
GCF_000171515.1
GCF_000020745.1
GCF_000020885.1
GCF_000022165.1
)

# Create output folder
mkdir -p "$OUTPUT_DIR"

# Loop through each accession
for acc in "${ACCESSIONS[@]}"; do
    fasta_file=$(ls "$GENOME_DIR"/${acc}_*_genomic.fna 2>/dev/null)

    if [[ -f "$fasta_file" ]]; then
        output="${OUTPUT_DIR}/${acc}_BUSCO"
        echo "Running BUSCO on $fasta_file ..."

        # Run BUSCO, overwrite existing results if necessary
        busco -i "$fasta_file" \
              -o "$output" \
              -l "$LINEAGE" \
              -m genome \
              --cpu "$CPU" \
              -f   # force overwrite if folder exists
    else
        echo "Warning: FASTA file for $acc not found!"
    fi
done

echo "All BUSCO runs finished. Results are in $OUTPUT_DIR"

