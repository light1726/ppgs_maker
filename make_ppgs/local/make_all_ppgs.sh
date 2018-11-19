#!/usr/bin/bash

export PATH=$PATH:/home/lh17/project/ppgs_maker/make_ppgs/local
data_dir=/home/lh17/project/ppgs_maker/make_ppgs/ppgs
save_dir=/home/lh17/project/ppgs_maker/make_ppgs/vc_data/normal
save_dir_1=/home/lh17/project/ppgs_maker/make_ppgs/vc_data/pre_softmax

for x in bdl rms slt; do
	echo "saving ppgs_dict"
	ppgs2pickle.py -f $data_dir/$x/$x.ppgs -d $save_dir/$x
	echo "saving pre-softmax ppgs_dict"
	ppgs2pickle.py -f $data_dir/$x/$x.presoftmax.ppgs -d $save_dir_1/$x
done

echo "Done!"
exit 1;
