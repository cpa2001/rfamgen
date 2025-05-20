#!/bin/bash

# run RfamGen on multiple families

data_root_dir="./data/rnagpt_250405"
output_root_dir="./outputs/rnagpt_250405"
thread=128

# for all the families
for rfam in $(ls $data_root_dir); do
# rfam="RF03154"
# if [ "$rfam" == "RF03154" ]; then
    echo "Running RfamGen on $rfam"

    rfam_dir="${data_root_dir}/${rfam}"
    echo "Rfam directory: ${rfam_dir}"

    # skip RF00163 and RF00622
    # if [[ "$rfam" == "RF00163" || "$rfam" == "RF00622" ]]; then
    #     echo "Skipping $rfam"
    #     continue
    # fi

    # run the pipeline
    # echo "Converting stockholm to fasta for ${rfam_dir}"
    # python txt_to_fasta.py --rfam "${rfam}" --dir "${rfam_dir}"
    
    # echo "Running 1_preprocess_seq.sh"
    # echo "Current system time: $(date)"
    # ./1_preprocess_seq.sh "${rfam}" "${rfam_dir}" $thread

    # echo "Running 2_make_onehot_from_traceback.sh"
    # echo "Current system time: $(date)"
    # ./2_make_onehot_from_traceback.sh "${rfam}" "${rfam_dir}" $thread

    # echo "Running 3_train_split.sh"
    # echo "Current system time: $(date)"
    # ./3_train_split.sh "${rfam}" "${rfam_dir}"

    # echo "Running 4_gen_weight.sh"
    # echo "Current system time: $(date)"
    # ./4_gen_weight.sh "${rfam}" "${rfam_dir}" $thread

    echo "Current system time: $(date)"
    output_dir="${output_root_dir}/${rfam}"
    mkdir -p "${output_dir}"

    # echo "Running 5_train.sh"
    # echo "Current system time: $(date)"
    # ./5_train.sh "${rfam}" "${rfam_dir}" "${output_dir}" 200 2  # epoch, batch_size
    # ./5_train.sh "${rfam}" "${rfam_dir}" "${output_dir}" 200 8  # epoch, batch_size

    echo "Running 6_generation.sh"
    echo "Current system time: $(date)"
    ./6_generation.sh "${rfam}" "${rfam_dir}" "${output_dir}" 500  # sample number

    # break
# fi
done


