Follow-Up Analysis: Core Membrane Genes and Accessory Gene Functions
1. **Analysis Description and Rationale** <br>

This follow-up analysis examines the core/pangenome results for both conserved and variable genetic components. Firstly, by analyzing the core genes to identify genes associated with different membrane functions, like those that may act as potential host-cell receptors and are important for bacterial interaction with the environment or host. Secondly, predict the different functional characteristics of accessory genes (shell and cloud genes) between serovars, since these genes may contribute to strain-specific traits such as virulence, adaptation, and horizontal gene transfer. <br>

<br>

2. **Pipeline (GitHub-ready script)** <br>

Save as: <br>
    scripts/PANAROO/followup_analysis.sh

<br>

Full reproducible script
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

<br>

3. **Key Results Summary**
**Core Genome**
Core genes: 3686 <br>
Membrane-associated core genes identified: <br>
Inner membrane proteins <br>
Outer membrane proteins <br>
Lipoproteins <br>

Represents conserved surface-exposed proteins


**Accessory Genome** <br>
Shell genes: 1360 <br>
Cloud genes: 1552 <br>
Accessory genome ≈ 44% of total genes <br>
**Top functional categories**
Hypothetical proteins (678) <br>
Phage proteins (multiple categories) <br>
Inner membrane proteins <br>
Lipoproteins <br>
Fimbrial proteins <br>
Transposases

<br> 

4. **Biological Interpretation**
**Core genes: Membrane-associated functions** <br>

The conserved membrane-associated core genes are shown across all strains, this suggests the important role played in bacterial survival. These proteins are located on or near the cell surface and may function as host-cell receptors, transport proteins, or structural components. This conservation indicates a critical fundamental process for nutrient uptake and environmental sensing.


**Accessory genes: Serovar differences**
**Host interaction and virulence**

The presence of fimbrial, lipoprotein, and membrane-associated genes suggests different serovars may vary in ability to:
<br>
Adhere to host cells
Colonize environments <br>
Interacts with host tissues <br>

**Horizontal gene transfer and evolution**

The indication of phage-related genes and transposases abundance:

Active horizontal gene transfer <br>
Increased diverse genetics <br>

Some serovars evolve faster or even acquire new traits more readily.


**Environmental adaptation**

Variation in accessory gene content suggests: <br>

Adaptation to different ecological niches <br>
Differences in stress response or metabolism <br>


**Unknown functional diversity**

The high number of hypothetical proteins indicates: <br>

Many unknown serovar-specific functions <br>
Undiscovered potential biological mechanisms <br>

<br>

5. **Final Report Paragraph (~1 paragraph)** <br>

Analyzing the core and accessory genomes reveals distinct roles in bacterial function and diversity. Core genes including multiple conserved membrane-associated proteins found across all strains, plays an essential role in cellular processing, like transport and environmental sensing. These proteins also function as host-cell receptors due to surface localization. Whereas, the accessory genome shows functional variability, with high numbers of hypothetical proteins and genes associated with mobile genetic elements such as phages and transposases. The presence of fimbrial, lipoprotein, and membrane-associated genes suggests different variation among serovars may have in their ability to adhere to host cells and adapt to environmental conditions. Overall, the results indicate that while the core genome maintains essential functions, the accessory genome drives strain-specific differences, including potential variation in virulence, adaptability, and evolutionary flexibility.

