#!/bin/bash
#SBATCH --job-name=eval
#SBATCH --ntasks=1                   # number of MP tasks
#SBATCH --nodes=1
#SBATCH --cpus-per-task=10           # number of cores per tasks
#SBATCH --hint=nomultithread         # we get physical cores not logical
#SBATCH --time=10:00:00             # maximum execution time (HH:MM:SS)
#SBATCH --output=%x-%j.out          # output file name
#SBATCH --account=ajs@v100
#SBATCH --gres=gpu:1                # number of gpus

accelerate launch --config_file config_1a100.yaml main.py \
--model santacoder-git-commits \
--tasks quixbugs \
--do_sample False \
--n_samples 1 \
--batch_size 1 \
--allow_code_execution \
--save_generations \
--trust_remote_code \
--mutate_method edit \
--generations_path generations_quixbugs_santacodergitcommits_greedy.json \
--output_path evaluation_results_quixbugs_santacodergitcommits_greedy.json \
--max_length_generation 2048