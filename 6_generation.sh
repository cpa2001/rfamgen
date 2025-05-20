#!/bin/bash


rfam=$1
rfam_dir=$2
output_dir=$3
n_samples=$4

# find the checkpoint file with the largest epoch number
ckpt_path=$(ls ${output_dir}/model_epoch*.pt | sort -V | tail -n 1)

echo "Sampling sequences from the model checkpoint: ${ckpt_path}"

python scripts/sampling_from_gauss.py \
    --config "${output_dir}/config.yaml" \
    --ckpt "${ckpt_path}" \
    --cmfile "${rfam_dir}/${rfam}.cm" \
    --outfasta "${output_dir}/sampled_seq_${n_samples}.fa" \
    --n_samples $n_samples


