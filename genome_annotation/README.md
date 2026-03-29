# **Genome Annotation Overview** 
<br>

**Project Purpose:** 
<br>
The goal for this section of the project is to use Bakta to annotate the bacterical genomes (/genomes_raw), to generate needed outputs for genome visualizatiom and analysis. 
<br>
**Data Source:** 
<br>
The NCBI RefSeq genome references are found in the /genomes_raw folder. <br>
Prior to annotation, genomes were filtered based on the BUSCO completeness scores being above 90% (See BAKTA/approved_genomes.txt). 
<br>

**The Genomes Used:**
<br>
GCF_000007545.1
GCF_000020745.1
GCF_000020885.1
GCF_000020925.1
GCF_000022165.1
GCF_000170215.1
GCF_000171415.1
GCF_000171515.1
GCF_000171535.2

**Sequence Generation**
- The genomes were downloaded in a FASTA format from NCBI RefSeq (Prior to filtering):
  GCF_000007545.1_ASM754v1_genomic.fna
  GCF_000020745.1_ASM2074v1_genomic.fna
  GCF_000020885.1_ASM2088v1_genomic.fna
  GCF_000020925.1_ASM2092v1_genomic.fna
  GCF_000022165.1_ASM2216v1_genomic.fna
  GCF_000170215.1_ASM17021v1_genomic.fna
  GCF_000170255.1_ASM17025v1_genomic.fna
  GCF_000171255.1_ASM17125v1_genomic.fna
  GCF_000171275.1_ASM17127v1_genomic.fna
  GCF_000171315.1_ASM17131v1_genomic.fna
  GCF_000171415.1_ASM17141v1_genomic.fna
  GCF_000171515.1_ASM17151v1_genomic.fna
  GCF_000171535.2_ASM17153v2_genomic.fna

- Bakta was used the NCBI RefSeq genomes to compare with a db-light database,  --complete flag, and  --threads 6 (this can change according to needs).

- Bakta

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
