# Core Pan: Pan-Genome Analysis Overview
## The Purpose

The purpose of this project is to analyze the pan-genome of a set of bacterial genomes to identify core and accessory genes, assess genome completeness, and explore evolutionary relationships.

## Data Source

The genomic data used in this project were obtained from NCBI RefSeq. The dataset consists of multiple bacterial genomes in FASTA format.

## Genome Selection

Only curated genomes were included in the analysis. These genomes are listed in scripts/BAKTA/approved_genomes.txt: <br>

GCF_000007545.1 <br>
GCF_000020745.1 <br>
GCF_000020885.1 <br>
GCF_000020925.1 <br>
GCF_000022165.1 <br>
GCF_000170215.1 <br>
GCF_000171415.1 <br>
GCF_000171515.1 <br>
GCF_000171535.2 <br>
<br>

## Sequence Generation

Genomes were annotated using Bakta, producing .gff3 files stored in the genomes_annotated/ folder. Genome completeness was assessed with BUSCO using the lineage dataset (bacteria_odb10). Core genes were aligned, filtered, and used for pan-genome analysis with Panaroo.

## Tools Used
- Bakta – genome annotation and standardization of gene sequences.
- BUSCO – genome completeness assessment using conserved single-copy orthologs.
- Panaroo – core and pan-genome determination and gene presence/absence analysis.
- CD-HIT – protein clustering to reduce redundancy (90% identity threshold).
- MAFFT – multiple sequence alignment of core genes.
- IQ-TREE / FastTree – phylogenetic tree construction.
- Cytoscape – visualization of gene co-occurrence networks.
- Panaroo Workflow

Annotated GFF3 files from genomes_annotated/ were used as input for Panaroo:

panaroo -i $(find genomes_annotated -name "*.gff3") \ <br>
        -o results_core/ \ <br>
        --clean-mode strict \ <br>
        --remove-invalid-genes \ <br>
        -a core \ <br>
        --aligner mafft \ <br>
        -t 8 <br>

## Parameter explanations:

--clean-mode strict – conservative mode to remove potential contamination. <br>
--remove-invalid-genes – ignores genes with invalid annotations (e.g., pseudogenes or unusual lengths). <br>
-a core – generates core gene alignment. <br>
--aligner mafft – uses MAFFT for multiple sequence alignment. <br>
-t 8 – uses 8 CPU threads for parallel processing. <br>

Key output files from this workflow were copied into the repository’s core_pan/ folder for downstream analysis.

## Key Parameters and Choices
- Core genes were defined as present in ≥ 99% of genomes; remaining genes classified as accessory.
- Panaroo default settings with filtering of low-quality genes were used.
- CD-HIT clustered protein sequences at 90% identity.
- MAFFT performed multiple sequence alignments followed by filtering.
- BUSCO assessed genome completeness using (bacteria_odb10).
- Reproducing Results

## Clone the repository:

1. cd <to the directory you want> and then git clone < repository name >
2. Install dependencies: Bakta, BUSCO, Panaroo, MAFFT, CD-HIT, IQ-TREE, Cytoscape.
3. Annotate genomes with Bakta and check completeness with BUSCO.
4. Run Panaroo on annotated genomes using the command above.
5. All key results are stored in the core_pan/ folder.

## File Naming Conventions and Structure
core_pan/ – pan-genome analysis results: <br>
    - gene_presence_absence.csv – gene ubiquity across genomes. <br>
    - gene_presence_absence.Rtab – tabular format for R visualization. <br>
    - summary_statistics.txt – Panaroo summary of core and accessory genes. <br>
    - core_gene_alignment_filtered.aln – alignment of filtered core genes. <br>
    - tree.nwk – phylogenetic tree in Newick format. <br>
    - final_graph.gml – network visualization of gene co-occurrence.





