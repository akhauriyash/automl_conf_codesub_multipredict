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

# cd /home/userid/projects/automl_multipredict

# # # # FBNet Adversarial Task 20
# time python fsh_advanced_training.py --config_idx 27120027

# ## FBNet Default Task
# # Index
# time python fsh_advanced_training.py --config_idx 27120021
# # Sample
# time python fsh_advanced_training.py --config_idx 27120022
# # Hardware Embedding
# time python fsh_advanced_training.py --config_idx 27120020



# cd /home/userid/projects/few_shot_hardware/fsh

# python fsh_advanced_training.py --config_idx 27120013


cd /home/userid/projects/fsp_nas

python super_script.py --num_trials 3 --num_samples 10 --task nd \
--search_space nasbench201 --test_help --help_mode default_help --dev_train_samples_nb 100
python super_script.py --num_trials 3 --num_samples 10 --task nd \
--search_space nasbench201 --test_help --help_mode default_help --dev_train_samples_nb 200
python super_script.py --num_trials 3 --num_samples 10 --task nd \
--search_space nasbench201 --test_help --help_mode default_help --dev_train_samples_nb 400
python super_script.py --num_trials 3 --num_samples 10 --task nd \
--search_space nasbench201 --test_help --help_mode default_help --dev_train_samples_nb 800