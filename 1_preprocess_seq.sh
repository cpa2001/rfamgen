#!/bin/bash


seed_path="./datasets/Rfam.seed"

rfam_id=$1  # rfam family id, e.g. RF00005
rfam_dir=$2  # directory to this rfam family, e.g. ./data/RF00005
threads=$3  # number of threads to use

# output_dir="${data_dir}/${rfam_id}"

python scripts/get_tidy_sequences_from_fasta_rfam.py \
    --seed_file "${seed_path}" \
    --rfam "${rfam_id}" \
    --output_dir "${rfam_dir}" \
    --cpu "${threads}"


