## Spring 2026 Bioinformatics Capstone Project: Bacterial Genome Assembly Evaluation 

# Project Overview

This project evaluateds the bacterial genome assemblies of Salmonella Serovars to determine their quality using standard assembly meterics and BUSCO completeness scores (%). The main goal is to identify high quality assemblies and generate a dataset for comparative genomics. 

# Purpose

The Purpose of the Project:

- Assess the assemblies of available bacterial genomes.
- Evaluate the "3 C's" of genome assembly:
    1. Contiguity: how continuous the sequences are (N50, number of contigs).
    2. Completeness: presence of expected core genes using BUSCO.
    3. Correctness: accuracy of the sequence order/orientation (inferred from BUSCO duplication/fragmentation).
- Provide scripts that are repoducible and outputs are standardized for future analyses. 

# Source Data
- The script: scripts/download_genomes.sh was used to download genome sequences from NCBI RefSeq using a curated list of accession numbers (cleaned_accession.txt).
- download_genomes.sh had to be modified with the assistance of Chatgpt to be able to work on a mac computer.
- The raw genomes are stored in the geomes_raw folder.
- The unzipped assemblies are located in the assemblies folder

# Tools Used
| Tool / Script                  | Purpose                                                                                                   |
| ------------------------------ | --------------------------------------------------------------------------------------------------------- |
| **BUSCO v6**                   | Evaluate completeness of genomes based on conserved single-copy genes.                                    |
| **download_genomes.sh**        | Automates downloading of genomes from NCBI RefSeq.                                                               |
| **run_busco.sh**               | Runs BUSCO for each genome assembly.                                                                      |
| **parse_busco_summaries.sh**   | Extracts BUSCO metrics (C, S, D, F, M, n) into a summary TSV.                                             |
| **generate_assembly_stats.sh** | Computes assembly statistics, including contiguity metrics like N50, total length, and number of contigs. |

| **Conda**        | Computer program that is needed to be able to run the program. |
        

# Key Parameters & Choices
- BUSCO dataset: bacteria_odb10
- BUSCO mode: genome
- CPU used: 4 (This is adjustable in scripts)
- Assembly meterics: total length, number of contigs, scaffold N50
- Scrips are reproducible:
  - download_genomes.sh: download genomes from NCBI
  - run_busco.sh: runs BUSCO on each genome.
  - parse_busco_summaries.sh: extracts BUSCO metrics for completeness.
  - generate_assembly_stats.sh: computes the assembly statistics includes N50.

# Reproducing Results
  1. Clone the repository:
    - git clone < repository name >
    - Change directory to where the repository is located or move where desired.
      
  2. Ensure dependies are installed:
    - Install miniconda and conda (either https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html or curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh)
    - conda activate busco_env (this activates the busco environment)

  3. Download genome assemblies, if they are not already in the repository:
    - ./scripts/download_genomes.sh

  4. Run BUSCO on all genomes:
    - ./scripts/run_busco.sh

  5. Parse BUSCO outputs: 
    - ./scripts/parse_busco_summaries.sh
    - The outputs are saved as busco_results/BUSCO_summary.tsv

  6. Calculating the assemb statistics (N50 and combine with BUSCO metrics:
    - ./scripts/generate_assembly_stats.sh
    - The outputs are saved as assembly_evaluation/assembly_stats.tsv
 
# Files Names & Repository Structure

| Bioinformatics-Capstone-MeaghanBarrett/             |                                                                                          |
| ---------------- | --------------------------------------------------------------------------------------------------- |
| **accession_files/**             | Lists of Genome Accession Numbers    |
| **assemblies/**                  | Downloaded Genome Assemblies         |
| **assembly_evaluation/**         | Final Statistics & Analysis Outputs  |
          
| **assembly_evaluation/assembly_stats.tsv**        | Statistical Report  |
| **busco_results/**     | BUSCO outputs.                 |
| **busco_results/BUSCO_summary.tsv** | BUSCO completeness Report |
| **genomes_raw/**        | Original Raw Genome Files│
| **scripts/**        | Bash scripts for analysis.│
| **scripts/download_genomes.sh**        | Downloads genomes from NCBI│
| **scripts/run_busco.sh**        | File to automate workflow  │
| **scripts/parse_busco_summaries.sh**        | File to parse together workflow |
| **scripts/generate_assembly_stats.sh**        | File to automate statistics for workflow│
| **.gitignore**        | Ignores files and folders for git│
| **README.md**        |  |          
| **other logs / downloads**        |  |          


# 3 C's of Genome Assembly
| Metric           | Source                                        |
| ---------------- | --------------------------------------------- |
| **Contiguity**   | `generate_assembly_stats.sh` → N50, # contigs |
| **Completeness** | BUSCO → C, S, D, F, M, n                      |
| **Correctness**  | BUSCO duplication/fragmentation rates         |
