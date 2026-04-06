# Core Pan Overview
## Project Purpose: Pan-Genome Analysis

The goal of this section of the project is to analyze the pan-genome of the bacterial genomes to identify core and accessory genes, assess genome completeness, and explore evolutionary relationships of the different bacterial strains.

## Data Source

The NCBI RefSeq genome references are found in the /genomes_raw folder. The dataset consists of multiple bacterial genomes in FASTA format. Prior to annotation, genomes were filtered based on the BUSCO completeness scores being above 90% (See BAKTA/approved_genomes.txt).

## Genome Selection

Only curated genomes were included in the analysis. Genomes listed in scripts/BAKTA/approved_genomes.txt: <br>

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

Bakta annotated genomes, producing GFF3 files located in genomes_annotated folder. Genome completeness was assessed with BUSCO using the lineage dataset (bacteria_odb10). Core genes were aligned, filtered, and used for pan-genome analysis with Panaroo.

## Tools Used
- Bakta – Gene sequencing for genome annotation and standardization.
- BUSCO – Assessment for genome completeness assessment using orthologs.
- Panaroo – Determins Core and pan-genome and gene presence/absence analysis.
- CD-HIT – Clustering protein to reduce redundancy (90% identity threshold).
- MAFFT – Multiple core genes sequence alignment.
- IQ-TREE – Constructs phylogenetic tree.
- Cytoscape – Visualize gene co-occurrence networks.
- Panaroo Workflow

### Annotated GFF3 files from genomes_annotated/ were used as input for Panaroo:

panaroo -i $(find genomes_annotated -name "*.gff3") \ <br>
        -o results_core/ \ <br>
        --clean-mode strict \ <br>
        --remove-invalid-genes \ <br>
        -a core \ <br>
        --aligner mafft \ <br>
        -t 8 <br>

### Parameter explanations:

--clean-mode strict – Mode that removes potential contamination. <br>
--remove-invalid-genes – Ignores invalid gene annotations. <br>
-a core – Generates core gene alignment. <br>
--aligner mafft – MAFFT used for multiple sequence alignment. <br>
-t 8 – Uses 8 CPU threads for parallel processing. <br>

Key output files from this workflow were copied into the repository’s core_pan/ folder for downstream analysis.

## Why?
Panaroo was one of the recommended pangenome tools when searching online. CD-HIT & MAFFT are dependents needed. BAKTA and BUSCO were needed to complete Panaroo. IQ-TREE is needed to be able to see the NWK pylogenic tree. Cytoscape is good for seeing the gene shapes.      

## Key Parameters and Choices
- Core genes were defined as present in ≥ 99% of genomes; remaining genes classified as accessory.
- Panaroo default settings with filtering of low-quality genes were used.
- CD-HIT clustered protein sequences at 90% identity.
- MAFFT performed multiple sequence alignments followed by filtering.
- BUSCO assessed genome completeness using (bacteria_odb10).
- Reproducing Results
- Mode:--clean-mode strict
- CPU: 8
- Outputs:
        - .aln, .embl, .fasta / .fa, .txt, .clstr, .csv, .Rtab, .nwk, .sif, and .png.

## Clone the repository:

1. cd < repository name> to where you want and then git clone < repository name >
2. Run the assemblies, check BUSCO completeness with BUSCO, and Annotate genomes with Bakta.
3. Visit <https://gthlab.au/panaroo/#/gettingstarted/installation> for instructions for installing Panaroo & dependencies: Bakta, BUSCO, Panaroo, MAFFT, CD-HIT, IQ-TREE, Cytoscape.
4. Run annotated genomesin Panaroo using the command above into results_core.
5. Move all the key results are stored in the core_pan/ folder.

## File Naming Conventions and Structure
core_pan/ – pan-genome analysis results: <br>
    - gene_presence_absence.csv – Gene ubiquity across genomes. <br>
    - gene_presence_absence.Rtab –  R visualization. <br>
    - summary_statistics.txt – Summary of Panaroo core and accessory genes. <br>
    - core_gene_alignment_filtered.aln – Filtered core genes alignment. <br>
    - tree.nwk – Newick phylogenetic tree. <br>
    - final_graph.gml – Visualization of gene network co-occurrence.





