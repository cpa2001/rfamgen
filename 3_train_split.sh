#!/bin/bash


rfam=$1
rfam_dir=$2

h5_path="${rfam_dir}/${rfam}_unique_seed_removed_notrunc_traceback_onehot_cm.h5"

python scripts/split_onehot_train_valid_test.py \
    -i "${h5_path}" \
    --train_ratio 0.7 \
    --random_state 42
