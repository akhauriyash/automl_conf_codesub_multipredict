### MultiPredict Transfer Learning Implementation

## TL Experiments

1. The .csv for tests can be found in config_mapper.log
2. Please identify the base_config_%s.json % (str(test_idx)) from the config_mapper to find the corresponding Transfer Learning tests
3. Configuration changes can be made in the base_config_*.json files to run the main code.
4. You can run the TL code simply by executing ```python -i fsh_advanced_training.py --config_idx test_idx```

## Transfer Experiments

1. To run: ```transfer_experiments.py --crosstask_m 'micro_to_macro'```. The task transfer sets are provided in the ```transfer_experiments.py``` codebase. 
2. Custom transfer tasks can be designed and executed by adding an if condition to crosstask_m and setting the appropriate ```training_spaces``` and ```testing_sets```. 
3. Confusion matrices will be saved in ```fs_zcp_crosstask```

## HWL FBNet <-> NASBench201 transfer

1. To run: ```python hwl_fb_nb201_transfer.py --mode 'fb_to_nb' / 'nb_to_fb'```
2. The graphs will be saved in ```cross_arch_nb_fb_hwl_vec```
