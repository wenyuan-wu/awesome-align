#!/bin/bash


for lang in EN-US FR IT
do
    for data_set in test dev
    do
        mkdir -p align_result_$lang
        DATA_FILE=../jobad_data/fast_align_data_$lang/$data_set.txt
        MODEL_NAME_OR_PATH=bert-base-multilingual-cased
        OUTPUT_FILE=align_result_$lang/$data_set.align
        CUDA_VISIBLE_DEVICES=0 awesome-align \
            --output_file=$OUTPUT_FILE \
            --model_name_or_path=$MODEL_NAME_OR_PATH \
            --data_file=$DATA_FILE \
            --extraction 'softmax' \
            --batch_size 32
    done
done


#mkdir -p align_result_EN-US
#
#DATA_FILE=../jobad_data/fast_align_data_EN-US/test.txt
#MODEL_NAME_OR_PATH=bert-base-multilingual-cased
#OUTPUT_FILE=align_result_EN-US/test.align
#
#CUDA_VISIBLE_DEVICES=0 awesome-align \
#    --output_file=$OUTPUT_FILE \
#    --model_name_or_path=$MODEL_NAME_OR_PATH \
#    --data_file=$DATA_FILE \
#    --extraction 'softmax' \
#    --batch_size 32
