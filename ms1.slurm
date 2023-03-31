#!/bin/bash
#SBATCH -J help_tests
#SBATCH -o large_scale_run_logs/help_tests_%j.out
#SBATCH -e large_scale_run_logs/help_tests_%j.err
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=16000
#SBATCH -t 48:00:00
#SBATCH --partition=lab_node
#SBATCH --nodelist=lab_node-compute-01 
#SBATCH --account=lab_node
#SBATCH --gres=gpu:1


source /share/apps/anaconda3/2021.05/etc/profile.d/conda.sh 

conda activate unr

cd /home/userid/projects/automl_multipredict
# # # NASBench201 Default Task 400samples
time python fsh_advanced_training.py --config_idx 27120035

# python super_script.py --num_trials 3 --num_samples 10 --task fd \
# --search_space fbnet --test_help --help_mode default_help --dev_train_samples_fb 2000
# # # # NASBench201 Default Task 400samples
# time python fsh_advanced_training.py --config_idx 27120033

# # # NASBench Adversarial Task 20
# time python fsh_advanced_training.py --config_idx 27120030
# # # # FBNet Adversarial Task 20
# time python fsh_advanced_training.py --config_idx 27120026


# # NASBench Default Task
# # Index
# time python fsh_advanced_training.py --config_idx 27120015
# # Sample
# time python fsh_advanced_training.py --config_idx 27120016
# # Hardware Embedding + ZCP
# time python fsh_advanced_training.py --config_idx 27120013
# # Hardware Embedding + HWL
# time python fsh_advanced_training.py --config_idx 27120014




# cd /home/userid/projects/few_shot_hardware/fsh

# python fsh_advanced_training.py --config_idx 27120013


# cd /home/userid/projects/fsp_nas

# python super_script.py --num_trials 1 --num_samples 10 --task fl \
# --search_space fbnet --test_help --help_mode default_help