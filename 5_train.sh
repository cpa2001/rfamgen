#!/bin/bash


rfam=$1
rfam_dir=$2
output_dir=$3

epoch=$4
batch_size=$5
# prepare the config
echo "making output directory: ${output_dir}"
mkdir -p "${output_dir}"

./make_config.sh "${rfam}" "${rfam_dir}" "${output_dir}"

python scripts/train.py \
    --data_dir "${rfam_dir}" \
    --X_train "${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm_train.h5" \
    --w_train "${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm_train_weight_threshold0p1.h5" \
    --X_valid "${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm_valid.h5" \
    --w_valid "${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm_valid_weight_threshold0p1.h5" \
    --epoch $epoch \
    --beta 1e-3 \
    --use_anneal \
    --use_early_stopping \
    --log \
    --log_dir "${output_dir}" \
    --ckpt_iter 20 \
    --batch_size $batch_size

