# 2024_GonzalezOjeda_CLARC

## About

Code corresponding to the paper: 

Linkage-based ortholog refinement in bacterial pangenomes with CLARC.
Indra Gonzalez Ojeda, Samantha G Palace, Pamela P Martinez, Taj Azarian, Lindsay R Grant, Laura Hammitt, Bill Hanage, Marc Lipsitch
bioRxiv 2024.12.18.629228; doi: https://doi.org/10.1101/2024.12.18.629228

## Table of contents

- [Genomes](#genomes)
- [Figure 1](#figure-1)
- [Figure 2](#figure-2)
- [Figure 3](#figure-3)
- [Figure 4](#figure-4)
- [Figure 5](#figure-5)
- [Figure 6](#figure-6)
- [Figure 7](#figure-7)
- [Raising issues or concerns](#raising-issues-or-concerns)

## Genomes

A total of 8907 pneumococcal genomes were used in this study. Among these are 9 closed references and samples from 7 different carriage datasets. The locations and number of samples used from each dataset are:

- Southwest, USA - 937 samples
- Massachusetts, USA - 1347 samples
- Southampton, UK - 470 samples
- Maela, Thailand - 2920 samples
- Malawi - 629 samples
- South Africa - 1637 samples
- Iceland - 958 samples

The accession numbers for all samples used (divided by dataset) can be found in the [Genomes/accession_numbers](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/tree/main/Genomes/accession_numbers/) folder within this repository. 

Additionally, all corresponding assemblies (.fasta) and annotation files (.gff) can be found in this [Zenodo folder]()
  
## Figure 1

Workflow of CLARC tool:

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure1_v3.png" alt="CLARC workflow" width="750"/>  

## Figure 2

Distribution of pneumococcal strain clusters in different geographic locations:

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure2_v3.png" alt="Figure 2" width="900"/>  

### 2B, 2C

- code:
  - Jupyter notebook with processing of PopPUNK data: [Figure2_code_CLARC_2024.ipynb](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig2/code/Figure2_code_CLARC_2024.ipynb)
 
- data:
  - Output of PopPUNK analyses, along with the appropiate qfiles for each run can be found at: [Figures/Fig2/data/poppunk_typing](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/tree/main/Figures/Fig2/data/poppunk_typing)

## Figure 3

Reduction of gene oversplitting for various pneumococcal pangenome analyses (pangenomes generated added one dataset at a time, cumulatively)

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure3_v3.png" alt="Accessory and core count, Roary pre and post CLARC" width="750"/>  

### 3A and 3B

- code: The code used to summarize the accessory and core gene counts for all pneumococcal pangenome analyses can be found in the first 2 sections of this [jupyter notebook](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/code/essential_gene_analysis/Figure3_code_CLARC_2024_paper.ipynb) 

- data: The data used by the Figure3_code_CLARC_2024_paper.ipynb notebook can be found in compressed folders containing the Roary+CLARC results for all pneumococcal 7 pangenome analyses. These folders are hosted in this [Zenodo folder](10.5281/zenodo.14187853). Each identity threshold run (i95, i90, i80) has its own unique folder that the code references. 

### 3C

- **Extracting essential gene protein sequences from NCBI genomic features file**

  - code:

      In this analysis we go through every pangenome analysis generated and query essential genes previously characterized by [van Opijnen, et al. (2009)](https://www.nature.com/articles/nmeth.1377), to see if they were found in the accessory or core genome. 

      Firstly, the code in this [jupyter notebok](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/code/essential_gene_analysis/extracting_TIGR4_essential_genes_paper.ipynb) (extracting_TIGR4_essential_genes_paper.ipynb) was used to extract the protein sequences for the essential genes identified by van Opijnen, et al. (2009).

  - data:
 
      The pneumococcal essential genes were identified using the metadata from van Opijnen, et al. (2009), which can be found in this repository under the name [tnseq_essential_genes_paper_data.xls](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/data/essential_gene_analysis/tnseq_essential_genes_paper_data.xls).
      
      Additionally, to extract the appropiate essential gene sequences, we used the genomic feature file for the pneumococcal strain that was used in the Tn-Seq analysis (TIGR4). The NCBI accession number is [GCF_000006885.1](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000006885.1/). This gff can be found in this GitHub repository under the name [TIGR4_closed_ref_2001.gbff](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/data/essential_gene_analysis/TIGR4_closed_ref_2001.gbff)
 
- **Protein BLAST-ing pangenome analyses for essential gene protein sequences**

  - code:
 
      After obtaining the fasta file with the appropiate protein sequences, we use this [jupyter notebook](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/code/essential_gene_analysis/run_essential_blasting_paper.ipynb) (run_essential_blasting_paper.ipynb) which takes as input the path to the appropiate pangenome results folder (in this project, the i80, i90 and i95 folders available in this [Zenodo folder](10.5281/zenodo.14187853)). All appropiate directories and subdirectories can be found in these compressed folders.

     Importantly, the run_essential_blasting_paper.ipynb calls a bash script (essential_protein_blast_paper.sh) to run the blast commands. This bash script can be found [in this repository](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/code/essential_gene_analysis/essential_protein_blast_paper.sh). The bash script assumes that blast is installed within a conda environment named 'blast', when running the commands. If this is not the case for you, you can comment the first line. 

  - data:

    The extracted essential gene protein sequences that were used to build the BLASTP database (aka the output of the extracting_TIGR4_essential_genes_paper.ipynb notebook) can be found here under the name [strep_pneumo_essential_protein_seqs.fasta](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/data/essential_gene_analysis/strep_pneumo_essential_protein_seqs.fasta)

- **Summarizing BLASTP query results**

  - code: Once the blast results folders are created across the CLARC result folders, the data to quantify and summarize the query results into Figure 3C can also be found in the last section of the [Figure3_code_CLARC_2024_paper.ipynb](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig3/code/essential_gene_analysis/Figure3_code_CLARC_2024_paper.ipynb) jupyter notebook, alongside the code for Figures 3A and 3B.

  - data: As previously mentioned, the CLARC result folders for the different identity parameters (i95, i90, i80) including BLASTP query results can be found compressed in this [Zenodo folder](10.5281/zenodo.14187853)

## Figure 4

Breakdown of CLARC clusters found in all-carriage pneumococcal pangenome (8907 genomes)

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure4_v3.png" alt="All carriage CLARC cluster breakdown" width="750"/>  

This figure was generated using the Roary and Roary+CLARC results of the pangenome analysis built with all 8,907 pneumococcal genomes. Specifically, this analysis uses the pangenome analysis created with the default parameters (identity threshold = 95%).

### 4B and 4C

- code: Code to parse CLARC cluster summary (4B) and eggNOG mapper classifications (4C) can be found in this jupyter notebook titled [Figure4_code_CLARC_2024_paper.ipynb](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig4/code/Figure4_code_CLARC_2024_paper.ipynb)

- data: All data used by the previous jupyter notebook can be found in this [zipped folder](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig4/data/allcarriage_pangenome_i95.zip) within this repository

## Figure 5

Changes in accessory gene frequency dynamics before and after CLARC

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure5_v3_hists.jpg" alt="" width="750"/> 

### 5A and 5B

- code: The code used to generate figures 5A and 5B can be found in this jupyter notebook titled [Figure5_code_CLARC_2024_paper.ipynb](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig5/code/Figure5_code_CLARC_2024_paper.ipynb) within this repository.

- data: All data used by the previous jupyter notebook can be found in Figure 5's [data folder](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/tree/main/Figures/Fig5/data) within this repository, with the exception of the 'gene_presence_absence_roary_allc_i95.csv' input, which is hosted as a zipped file in [Zenodo](10.5281/zenodo.14187853).

## Figure 6

Assessing CLARC impact on post-vaccination prediction using a quadratic programming (QP) model

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure6_v3.jpg" alt="" width="750"/> 

### Figures 6A, 6B, 6C and 6D

The quadratic programming post vaccine population structure prediction model was implemented using an R integration into python. Therefore, the following analyses must be run from a conda environment with the appropiate python integration software (and R) downloaded. For the environment file and instructions on how to set up this part of the notebook see [this part](https://github.com/IndraGonz/nfds-tutorial/tree/main?tab=readme-ov-file#quadratic-programming-qp-model) of a previous GitHub tutorial I wrote covering this topic. Once you have the environment properly set up, you can proceed to run the code in this section.

- code: Code to analyze the data and reproduce all figures can be found in a jupyter notebook named [Figure6_code_CLARC_2024_paper.ipynb](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig6/code/Figure6_code_CLARC_2024_paper.ipynb) within this repository. This jupyter notebook calls a series of R functions that can also be found in the [Figure 6 code folder](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/tree/main/Figures/Fig6/code) in this repository.

- data: All the appropiate data used to generate the figures can be found in Figure 6's [data folder](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/tree/main/Figures/Fig6/data).

## Figure 7

Comparison of Roary and Panaroo in pneumococcal population structure prediction model

<img src="https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/images/Figure7_v3.jpg" alt="" width="750"/> 

Figure 7 uses the same environment set-up as Figure 6, so make sure to run it from a conda environment that has the python-R integration software (rpy2) downloaded.

- code: Code to analyze the data and reproduce this figure can be found in a jupyter notebook named [Figure7_code_CLARC_2024_paper.ipynb](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/blob/main/Figures/Fig7/code/Figure7_code_CLARC_2024_paper.ipynb) within this repository. This jupyter notebook also calls the previously used R functions found in the [Figure 6 code folder](https://github.com/IndraGonz/2024_GonzalezOjeda_CLARC/tree/main/Figures/Fig6/code) within this repository.

- data: All appropiate pangenome and CLARC results used in this analysis can be found in the [Zenodo folder](10.5281/zenodo.14187853), under the named specified by the jupyter notebook.

## Raising issues or concerns

If you have trouble replicating the analyses with any of the previous code/data, don't hesitate to contact me at igonzalezojeda@g.harvard.edu . Thank you very much for your time in checking this out!
