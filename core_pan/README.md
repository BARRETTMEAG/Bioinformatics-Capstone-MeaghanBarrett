# Pangenome Analysis of Salmonella Serovars Using Panaroo

## Project Overview
This project performs a pangenome analysis on a set of *Salmonella* serovar genome assemblies to identify core and accessory genes and investigate genomic diversity across strains. The analysis focuses on gene presence/absence patterns and core genome phylogeny.

## Data Source
Genome assemblies were obtained from [NCBI / course-provided dataset]. These genomes represent multiple strains of *Salmonella*.

## Sequence Generation
The genomes were previously assembled and annotated. Gene annotations were provided in GFF3 format and used as input for downstream pangenome analysis.

## Tools Used
- **Panaroo**: to construct the pangenome and identify gene clusters  
- (Optional) **IQ-TREE**: for phylogenetic tree inference  
- (Optional) **Cytoscape**: for visualization of the pangenome graph  

## Rationale for Tool Selection
Panaroo was selected due to its ability to correct annotation errors, handle fragmented genes, and produce accurate gene clustering compared to alternatives such as Roary.

## Key Parameters
- Core gene threshold: 0.95 (genes present in ≥95% of genomes are considered core)  
- Cleaning mode: strict  
- Entropy-based filtering: enabled (default BMGE filtering for alignment quality)  

## Methods
Panaroo was run on all genome annotation files to generate:
- A gene presence/absence matrix
- A filtered core genome alignment
- A pangenome graph

Example command used:

```bash
panaroo -i *.gff -o results_core --clean-mode strictproduce accurate gene clustering compared to alternatives such as Roary.

## Key Parameters
- Core gene threshold: 0.95 (genes present in ≥95% of genomes are considered core)
- Cleaning mode: strict
- Entropy-based filtering: enabled (default BMGE filtering for alignment quality)

## Methods
Panaroo was run on all genome annotation files to generate:
- A gene presence/absence matrix
- A filtered core genome alignment
- A pangenome graph

Example command used:

```bash
panaroo -i *.gff -o results_core --clean-mode strict
