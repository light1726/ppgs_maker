#/usr/bin/bash


data_dir=/home/lh17/project/ppgs_maker/make_ppgs/data
mfcc_dir=/home/lh17/project/ppgs_maker/make_ppgs/mfcc
for x in bdl rms slt; do
	utils/fix_data_dir.sh $data_dir/$x
	steps/make_mfcc.sh --write_utt2num_frames true $data_dir/$x exp/make_mfcc/$x $mfcc_dir
	steps/compute_cmvn_stats.sh $data_dir/$x exp/make_mfcc/$x $mfcc_dir
done

echo "Success!"
