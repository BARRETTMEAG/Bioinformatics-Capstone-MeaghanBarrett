# Pangenome Analysis of Salmonella Serovars Using Panaroo

## Project Overview
This project performs a pangenome analysis on a set of Salmonella serovar genome assemblies to identify core and accessory genes, also investigates diversity across genomic strains. The analysis focuses on the patterns of gene presence/absence and core genome phylogeny.

## Data Source
Genome assemblies were obtained from NCBI using a curated list of accession numbers in `approved_genomes.txt`.  

## Sequence Generation
1. Genome assemblies were downloaded using the `download_genomes.sh` script:

```bash
bash download_genomes.sh
