#!/bin/bash

# Activate blast environment
conda activate blast

# Make sure to set the appropiate path to the fasta file containing the essential gene protein sequences.
essential_genes="~/strep_pneumo_essential_protein_seqs.fasta"

# Set file/folder paths from input arguments
acc_cogs=$1
core_cogs=$2
out_file_acc=$3
out_file_core=$4

# Make databases
makeblastdb -in ${essential_genes} -dbtype prot

# Run BLASTP search
blastp -task blastp -query ${acc_cogs} -db ${essential_genes} -evalue 1e-20 -num_threads 4 -out ${out_file_acc} -outfmt 6
blastp -task blastp -query ${core_cogs} -db ${essential_genes} -evalue 1e-20 -num_threads 4 -out ${out_file_core} -outfmt 6
