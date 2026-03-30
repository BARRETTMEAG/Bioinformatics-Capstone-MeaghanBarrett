# **Genome Annotation Overview** 
<br>
This folder contains the nine BAKTA annotation for each individual genome, each file has an their own TSV annotations file, .png that shows the sturcture of the genome, and a txt file that summarizes the genomes. For a full overview look at genome_summary.tsv (summarizes all the genomes) and bakta_genomes_annotated (this is a full annotation of the bakta files). 

<br>

# **Project Purpose:** 
<br>

- The goal for this section of the project is to use Bakta to annotate the bacterical genomes (/genomes_raw) using a standardized pipeline, generate outputs needed for analysis genome reports, creating visualizatiom and analysis, and demonstrating reproductible workflows. 
<br>

# **Data Source:** 
<br>
- The NCBI RefSeq genome references are found in the /genomes_raw folder. <br>
- Prior to annotation, genomes were filtered based on the BUSCO completeness scores being above 90% (See BAKTA/approved_genomes.txt). 
<br>

# **The Genomes Used:**
<br>
- GCF_000007545.1 <br>
- GCF_000020745.1 <br>
- GCF_000020885.1 <br>
- GCF_000020925.1 <br>
- GCF_000022165.1 <br>
- GCF_000170215.1 <br>
- GCF_000171415.1 <br>
- GCF_000171515.1 <br>
- GCF_000171535.2 <br>

<br>

# **Sequence Generation**
<br>
- The genomes were downloaded in a FASTA (.fna) format from NCBI RefSeq. <br>
- The complete genome sequences were ran through BUSCO and then filtered according to having a completeness score above 90%. <br>
- These .fna files were ran through the bash script run_bakta_filtered.sh according to the selected genomes (approved_genomes.txt) and then summarized into one summary.txt for all the genomes (summarized_bakta.sh). <br>

<br>

# **Tools Used** <br>
- Conda: Computer program, environment, dependencies needed to run Bakta. 
- Bakta: Automated Genome Annotation Tool.
  - Uses NCBI RefSeq genomes to compare chosen genomes with a db-light database,  --complete flag, and  --threads 6 (this can change according to needs).
  - bakta_database (light database downloaded <bakta_db download --output <output-path> --type [light|full]>)
  - Chosen for standdardization of annotations, integrates database, and clear outputs.
  - Visualization tools: Plotting genome plots (.png and .svg files).

<br>

# **Why These Tools?**
When attempting to run Prokka there were a lot of struggles when downloading and using the database. Bakta was a lot easier to use and the light database turned out to be less trouble to download than the full. As for conda, I had downloaded it for using BUSCO, so it just made sense to keep using it.

<br>

**Key Parameters and Choices**
- Bakta v6
- Database bakta_db (db-light)
- Mode: standard annotation --complete
- Threads: 4-6
- Outputs per genome:
  - .tsv, .gff3, .gbff, .faa, .ffn, .png, .txt 
<br>

**How to Reproduce:**
1. Clone the repository.
   
2. export PROJECT=/path/to/project (pick where you want this located)

  - #Step 1: Run BUSCO filtering <br>
    bash scripts/BUSCO/run_busco.sh
  
  - #Step 2: Create a Bakta environment <br>
    conda create -n bakta-env -c bioconda -c conda-forge bakta <br>
    conda activate bakta-env
  
  - #Step 3: Download bakta library light <br>
    bakta_db download --output /path/to/db-light --type light
  
  - #Step 4: Run genome annotation <br>
    bash scripts/BAKTA/run_bakta_filtered.sh

  - #Step 5: Generate summary file <br>
    bash scripts/BAKTA/summarize_bakta.sh

3. Copy outputs to genome_annotation/ as shown in the commands written.

<br>

# **File Naming Conventions & Structure**
genome_annotation/ # Summarized version of /bakta_genomes_annotated <br>
├── GCF_000007545.1/ <br>
│   ├── annotations.tsv     # human-readable annotation table <br>
│   ├── summary.txt         # genome metrics (length, GC%, CDS, tRNA, rRNA, CRISPRs) <br>
│   └── genome_plot.png     # circular genome plot <br>
├── GCF_000020745.1/ <br>
│   └── ... <br>
├── genome_summary.tsv       # combined summary of all genomes <br>
├── annotations.tsv          # combined annotations from all genomes <br>
└── README.md <br>

<br>

Explaination for each genome (/genome_annotation/GFC_000*):
annotations.tsv → human-readable TSV of gene features
genome_plot.png→ visual representation of the genome
summary.txt→ text summary of annotation statistics


