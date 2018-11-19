#!/usr/bin/bash

nnet_model=/home/lh17/project/ppgs_maker/timit/s5/exp_2/dnn4_pretrain-dbn_dnn/final.nnet
transform=/home/lh17/project/ppgs_maker/timit/s5/exp_2/dnn4_pretrain-dbn_dnn/final.feature_transform

delta_dir=/home/lh17/project/ppgs_maker/make_ppgs/delta-deltas
ppgs_dir=/home/lh17/project/ppgs_maker/make_ppgs/ppgs

for x in bdl rms slt; do
	nnet-forward --feature-transform=$transform --use-gpu=yes $nnet_model ark:$delta_dir/$x/delta_deltas.$x.ark ark:$ppgs_dir/$x/ppgs.ark
	nnet-forward --feature-transform=$transform --use-gpu=yes --no-softmax $nnet_model ark:$delta_dir/$x/delta_deltas.$x.ark ark:$ppgs_dir/$x/ppgs.presoftmax.ark
done

# transform the *.ark file to text file
for x in bdl rms slt; do
	copy-feats ark:$ppgs_dir/$x/ppgs.ark ark,t:$ppgs_dir/$x/$x.ppgs
	copy-feats ark:$ppgs_dir/$x/ppgs.presoftmax.ark ark,t:$ppgs_dir/$x/$x.presoftmax.ppgs
done

echo "Done!"
exit 1;
