#!/bin/bash
set -e

echo "Running follow-up genome analysis..."

# ----------------------------
# Paths
# ----------------------------
INPUT="results_core/gene_presence_absence.csv"
OUTPUT_DIR="Follow-Up_Analysis"
mkdir -p "$OUTPUT_DIR/core_genes"
mkdir -p "$OUTPUT_DIR/accessory_genes"

# ----------------------------
# 1. Extract CORE genes (present in all 9 genomes)
# ----------------------------
awk -F',' '
NR==1 {print; next}
{
  count=0
  for(i=4; i<=NF; i++) {
    if($i != "" && $i != "NA") count++
  }
  if(count == 9) print
}' "$INPUT" > "$OUTPUT_DIR/core_genes/core_genes.csv"

echo "Core genes extracted."

# ----------------------------
# 2. Identify membrane-associated CORE genes
# ----------------------------
grep -i "membrane\|lipoprotein\|outer membrane\|inner membrane" \
"$OUTPUT_DIR/core_genes/core_genes.csv" \
> "$OUTPUT_DIR/core_genes/membrane_core_genes.txt" || true

# ----------------------------
# 3. Extract ACCESSORY genes
# ----------------------------
awk -F',' '
NR==1 {print; next}
{
  count=0
  for(i=4; i<=NF; i++) {
    if($i != "" && $i != "NA") count++
  }
  if(count < 9) print
}' "$INPUT" > "$OUTPUT_DIR/accessory_genes/accessory_genes.csv"

echo "Accessory genes extracted."

# ----------------------------
# 4. Functional summary (accessory genes)
# ----------------------------
cut -d',' -f3 "$OUTPUT_DIR/accessory_genes/accessory_genes.csv" \
| sort | uniq -c | sort -nr | head \
> "$OUTPUT_DIR/accessory_genes/top_annotations.txt"

# ----------------------------
# 5. Mobile genetic elements
# ----------------------------
grep -i "transposase\|phage\|prophage\|integrase\|mobile" \
"$OUTPUT_DIR/accessory_genes/accessory_genes.csv" \
> "$OUTPUT_DIR/accessory_genes/mobile_elements.txt" || true

# ----------------------------
# 6. Membrane / host interaction genes
# ----------------------------
grep -i "membrane\|lipoprotein\|fimbrial" \
"$OUTPUT_DIR/accessory_genes/accessory_genes.csv" \
> "$OUTPUT_DIR/accessory_genes/membrane_genes.txt" || true

# ----------------------------
# 7. Hypothetical proteins
# ----------------------------
grep -i "hypothetical" \
"$OUTPUT_DIR/accessory_genes/accessory_genes.csv" \
> "$OUTPUT_DIR/accessory_genes/hypothetical_genes.txt" || true

echo "Analysis complete."