#!/bin/bash


rfam=$1
rfam_dir=$2
thread=$3

train_h5_path="${rfam_dir}/${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm_train.h5"
val_h5_path="${rfam_dir}/${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm_valid.h5"

python scripts/generate_weight.py \
    --mode cm \
    -i "${train_h5_path}" \
    --threshold 0.1 \
    --cpu $thread
    # n_samples 100

python scripts/generate_weight.py \
    --mode cm \
    -i "${val_h5_path}" \
    --threshold 0.1 \
    --cpu $thread
    # n_samples 100


