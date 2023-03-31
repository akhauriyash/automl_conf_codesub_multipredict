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
# # # NASBench201 Default Task 100samples
time python fsh_advanced_training.py --config_idx 27120035
cd /home/userid/projects/fsp_nas

python super_script.py --num_trials 3 --num_samples 10 --task fd \
--search_space fbnet --test_help --help_mode default_help --dev_train_samples_fb 500

# # # # NASBench201 Default Task 100samples
# time python fsh_advanced_training.py --config_idx 27120035

# # # NASBench Adversarial Task 20
# time python fsh_advanced_training.py --config_idx 27120029

# # # NASBench Adversarial Task 20
# time python fsh_advanced_training.py --config_idx 27120031

# # NASBench Adversarial Task
# # Vec
# time python fsh_advanced_training.py --config_idx 27120023
# # ZCP
# time python fsh_advanced_training.py --config_idx 27120024
# # HWL
# time python fsh_advanced_training.py --config_idx 27120025





# cd /home/userid/projects/few_shot_hardware/fsh

# python fsh_advanced_training.py --config_idx 27120013


# cd /home/userid/projects/fsp_nas

# python super_script.py --num_trials 1 --num_samples 10 --task fl \
# --search_space fbnet --test_help --help_mode default_help