#!/bin/bash


rfam=$1  # like "RF00005"
rfam_dir=$2  # like ./data/rnagpt_250405/
# root_dir="./data/jiyue_241005/${rfam}"
threads=$3  # liek 64

fasta_path="${rfam_dir}/${rfam}_unique_seed_removed.fa"
cm_path="${rfam_dir}/${rfam}.cm"

#seed_path="${rfam_dir}/${rfam}_seed.fa"
#sto_path="${rfam_dir}/${rfam}_notrunc.sto"
#sto_new_path="${rfam_dir}/${rfam}_unique_seed_removed_notrunc.sto"

#python remove_seed_from_sto.py \
#    -f "${seed_path}" \
#    -s "${sto_path}" \
#    -o "${sto_new_path}"

python scripts/make_onehot_from_traceback.py \
    --fasta "${fasta_path}" \
    --cmfile "${cm_path}" \
    --cpu "${threads}"



