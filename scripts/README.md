## Scripts Overview

NCBI -> BUSCO -> BAKTA -> PANAROO

This folder contains bash scripts that were used throughout this project. It begins with downloading the genomes in step 1. 

1- BUSCO/download_genomes.sh contains the script created by Dr. Brooks (UVU Professor) and modified by Chatgpt for mac users to download the salmonella genomes from NCBI into the assembilies folder, which was further trimmed down from assembiles/ncbi_dataset/data into genomes_raw with the assistance of accession_files/cleaned_accession.txt to give 13 genomes that will be used for this project. 

2- BUSCO/run_busco.sh contains the script used to organize raw data for assessment summary (parse_busco_summaries.sh) found in busco_results. 

3- BUSCO/generate_assembly_stats.sh contains the script for generateing statistics. 

4- BUSCO/parse_busco_summaries.sh contains the script for putting all the statistic assemblies summaries together.

5- BAKTA/run_bakta_riltered.sh takes the genomes that were filtered from 13 to 9 genomes (approved_genomes.txt) and generates files for every individual genome. The reports are summarized by summarize_bakta.sh. 




