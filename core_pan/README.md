# Salmonella Genome Annotation and Pangenome Analysis

This repository contains a reproducible pipeline for bacterial genome annotation using BAKTA and pangenome analysis using Panaroo. The workflow includes downloading genomes, filtering for completeness, annotation, and pangenome construction, with outputs for visualization and downstream analysis.

---

## Section 1: Genome Annotation Overview (BAKTA)

### Purpose
The goal of this section is to:

- Annotate bacterial genomes in `/genomes_raw` using a standardized BAKTA pipeline  
- Generate outputs for genome reports, visualization, and analysis  
- Demonstrate reproducible workflows

### Data Source
- NCBI RefSeq genome references are stored in `/genomes_raw`  
- Genomes were filtered for **BUSCO completeness ≥ 90%** (`BAKTA/approved_genomes.txt`)  

#### Genomes Used

