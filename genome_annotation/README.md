# **Genome Annotation Overview** 
<br>

**Project Purpose:** 
<br>
- The goal for this section of the project is to use Bakta to annotate the bacterical genomes (/genomes_raw) using a standardized pipeline, generate outputs needed for analysis genome reports, creating visualizatiom and analysis, and demonstrating reproductible workflows. 
<br>
**Data Source:** 
<br>
- The NCBI RefSeq genome references are found in the /genomes_raw folder. <br>
Prior to annotation, genomes were filtered based on the BUSCO completeness scores being above 90% (See BAKTA/approved_genomes.txt). 
<br>

**The Genomes Used:**
<br>
- GCF_000007545.1
- GCF_000020745.1
- GCF_000020885.1
- GCF_000020925.1
- GCF_000022165.1
- GCF_000170215.1
- GCF_000171415.1
- GCF_000171515.1
- GCF_000171535.2

**Sequence Generation**
- The genomes were downloaded in a FASTA format from NCBI RefSeq.
- Complete genome sequences.

**Tools Used**
- Bakta: Automated Genome Annotation Tool.
  - Uses NCBI RefSeq genomes to compare chosen genomes with a db-light database,  --complete flag, and  --threads 6 (this can change according to needs).
  - Chosen for standdardization of annotations, integrates database, and clear outputs.
  - Visualization tools: Plotting genome plots (.png and .svg files).

**Key Parameters and Choices**
- Bakta v6
- database path (db-light)
- --force
- CPU: --thread 6
- --complete
**How to Reproduce:**
1. Clone the repository.
2. Place genome FASTA files in a folder.
3. Run Bakta with the same parameters.
4. export PROJECT=/path/to/project
   
#Run annotation
bash scripts/run_bakta_filtered.sh

#Generate summary
bash scripts/generate_summary.sh

6. Copy outputs to genome_annotation/ as shown in the commands we wrote.
File Naming Conventions and Structure:
Explain that for each genome:
annotations.tsv → human-readable TSV of gene features
genome_plot.png→
visual representation of the genome
summary.txt→ text summary of annotation statistics
This folder contains the nine BAKTA annotation for each individual genome, each file has an their own TSV annotations file, .png that shows the sturcture of the genome, and a txt file that summarizes the genomes. For a full overview look at genome_summary.tsv. 
