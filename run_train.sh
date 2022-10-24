#!/bin/bash


# step 01

#mkdir -p model_fine_tune_EN-US_01
#
#TRAIN_FILE=../jobad_data/fast_align_data_EN-US/train.txt
#EVAL_FILE=../jobad_data/fast_align_data_EN-US/dev.txt
#OUTPUT_DIR=model_fine_tune_EN-US_01
#
#CUDA_VISIBLE_DEVICES=0 awesome-train \
#    --output_dir=$OUTPUT_DIR \
#    --model_name_or_path=bert-base-multilingual-cased \
#    --extraction 'softmax' \
#    --do_train \
#    --train_tlm \
#    --train_so \
#    --train_data_file=$TRAIN_FILE \
#    --per_gpu_train_batch_size 2 \
#    --gradient_accumulation_steps 4 \
#    --num_train_epochs 1 \
#    --learning_rate 2e-5 \
#    --save_steps 4000 \
#    --max_steps 20000 \
#    --do_eval \
#    --eval_data_file=$EVAL_FILE


# step 02

mkdir -p model_fine_tune_FR_02

TRAIN_FILE=../jobad_data/fast_align_data_FR/train.txt
EVAL_FILE=../jobad_data/fast_align_data_FR/dev.txt
OUTPUT_DIR=model_fine_tune_FR_02

CUDA_VISIBLE_DEVICES=0 awesome-train \
    --output_dir=$OUTPUT_DIR \
    --model_name_or_path=model_fine_tune_EN-US_01 \
    --extraction 'softmax' \
    --do_train \
    --train_tlm \
    --train_so \
    --train_data_file=$TRAIN_FILE \
    --per_gpu_train_batch_size 2 \
    --gradient_accumulation_steps 4 \
    --num_train_epochs 1 \
    --learning_rate 2e-5 \
    --save_steps 4000 \
    --max_steps 20000 \
    --do_eval \
    --eval_data_file=$EVAL_FILE


# step 03

mkdir -p model_fine_tune_IT_03

TRAIN_FILE=../jobad_data/fast_align_data_IT/train.txt
EVAL_FILE=../jobad_data/fast_align_data_IT/dev.txt
OUTPUT_DIR=model_fine_tune_IT_03

CUDA_VISIBLE_DEVICES=0 awesome-train \
    --output_dir=$OUTPUT_DIR \
    --model_name_or_path=model_fine_tune_FR_02 \
    --extraction 'softmax' \
    --do_train \
    --train_tlm \
    --train_so \
    --train_data_file=$TRAIN_FILE \
    --per_gpu_train_batch_size 2 \
    --gradient_accumulation_steps 4 \
    --num_train_epochs 1 \
    --learning_rate 2e-5 \
    --save_steps 4000 \
    --max_steps 20000 \
    --do_eval \
    --eval_data_file=$EVAL_FILE
