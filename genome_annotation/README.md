# **Genome Annotation Overview** 
<br>
Project Purpose: 
The goal for this section of the project is to use Bakta to annotate the bacterical genomes (genomes_raw) and to generate needed outputs to visualize the genomes. 

Data Source: 
These NCBI RefSeq are found in genomes_raw folder before they were filtered (BAKTA/approved_genomes.txt due to having an above 90% BUSCO Completeness score). The genomes that will be used is:
GCF_000007545.1
GCF_000020745.1
GCF_000020885.1
GCF_000020925.1
GCF_000022165.1
GCF_000170215.1
GCF_000171415.1
GCF_000171515.1
GCF_000171535.2


bakta_genomes_annotated/GCF_000171535.2:
GCF_000171535.2.embl                    GCF_000171535.2.inference.tsv
GCF_000171535.2.faa                     GCF_000171535.2.json
GCF_000171535.2.ffn                     GCF_000171535.2.log
GCF_000171535.2.fna                     GCF_000171535.2.png
GCF_000171535.2.gbff                    GCF_000171535.2.svg
GCF_000171535.2.gff3                    GCF_000171535.2.tsv
GCF_000171535.2.hypotheticals.faa       GCF_000171535.2.txt
GCF_000171535.2.hypotheticals.tsv

This folder contains the nine BAKTA annotation for each individual genome, each file has an their own TSV annotations file, .png that shows the sturcture of the genome, and a txt file that summarizes the genomes. For a full overview look at genome_summary.tsv. 
