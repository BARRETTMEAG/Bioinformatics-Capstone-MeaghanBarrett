# Bioinformatics Capstone Project – Pan-Genome Analysis
## Project Overview

The purpose of this project is to analyze the pan-genome of a set of bacterial genomes to identify core and accessory genes, assess genome completeness, and understand evolutionary relationships.

Data Source

The genomic data used in this project were obtained from [insert data source, e.g., NCBI RefSeq or a local sequencing project]. The dataset consists of multiple bacterial genomes in FASTA format.

Sequence Generation

Genomic sequences were annotated and processed to extract coding sequences (CDS) in both DNA and protein formats. Genome completeness was evaluated, sequences were aligned, filtered, and then used for pan-genome analysis.

Tools Used
Panaroo – for core and pan-genome determination and gene presence/absence analysis; chosen for robust handling of gene clustering and annotation errors.
Bakta – for genome annotation and alignment of gene sequences to standard references.
BUSCO – to assess genome completeness using conserved single-copy orthologs.
CD-HIT – for clustering protein sequences to reduce redundancy.
MAFFT – for multiple sequence alignment of core genes.
IQ-TREE / FastTree – for phylogenetic tree construction.
Cytoscape – for visualizing gene co-occurrence networks.
Key Parameters and Choices
Panaroo: default settings with filtering of low-quality genes.
CD-HIT: 90% sequence identity threshold for protein clustering.
MAFFT: automatic mode for alignment, followed by filtering to remove poorly aligned regions.
BUSCO: used [insert lineage dataset, e.g., bacteria_odb10] for completeness assessment.
Gene presence/absence thresholds defined to classify genes as “core” (present in ≥ 99% of genomes) or “accessory.”
Reproducing Results

Clone this repository:

git clone https://github.com/BARRETTMEAG/Bioinformatics-Capstone-MeaghanBarrett.git
cd Bioinformatics-Capstone-MeaghanBarrett
Ensure all dependencies are installed (Panaroo, Bakta, BUSCO, MAFFT, CD-HIT, IQ-TREE, Cytoscape).
Run genome annotation and completeness checks with Bakta and BUSCO.
Run Panaroo using the annotated genome files.
Results are stored in the core_pan folder.
File Naming Conventions and Structure
core_pan/ – contains pan-genome analysis results:
gene_presence_absence.csv – breakdown of gene ubiquity across genomes.
gene_presence_absence.Rtab – tabular format used for R visualization.
summary_statistics.txt – Panaroo summary of core and accessory genes.
core_gene_alignment_filtered.aln – alignment of filtered core genes.
tree.nwk – phylogenetic tree in Newick format.
final_graph.gml – network visualization of gene co-occurrence.






