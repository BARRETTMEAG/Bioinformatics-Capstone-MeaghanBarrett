#!/bin/bash

PROJECT=${PROJECT:-/path/to/project}

DB="$PROJECT/db-light"
GENOME_DIR="$PROJECT/genomes_raw"
OUTPUT_DIR="$PROJECT/bakta_genomes_annotated"
APPROVED="$PROJECT/scripts/BAKTA/approved_genomes.txt"

THREADS=6

"$PROJECT/annotation_evaluation/BAKTA/run_bakta_filtered.sh"

# Create main annotation directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

while read accession
do
    genome_file=$(ls ${GENOME_DIR}/${accession}*_genomic.fna 2>/dev/null)

    if [ -f "$genome_file" ]; then

        echo "Annotating $accession"

        # Use accession as base name
        base_name="$accession"

        # Create a separate folder for each genome annotation
        output_folder="$OUTPUT_DIR/$base_name"
        mkdir -p "$output_folder"

        bakta --db "$DB" \
              --output "$output_folder" \
              --prefix "$base_name" \
              --threads "$THREADS" \
              --complete \
              --force \
              "$genome_file"

        echo "Finished $accession"
        echo "----------------------------------"

    else
        echo "Genome file for $accession not found"
    fi

<<<<<<< HEAD
done < "$APPROVED"
=======
done < "$APPROVED"
>>>>>>> bf2c79a (Add local untracked files before rebase)
