#!/usr/bin/bash

cmvn_opts=
delta_opts=
cmd=run.pl
nj=1
data_dir=/home/lh17/project/ppgs_maker/make_ppgs/data
dest_dir=/home/lh17/project/ppgs_maker/make_ppgs/delta-deltas
log_dir=/home/lh17/project/ppgs_maker/make_ppgs/delta-deltas/log

for x in bdl rms slt; do
	sdata=$data_dir/$x;
	apply-cmvn $cmvn_opts --utt2spk=ark:$sdata/utt2spk scp:$sdata/cmvn.scp scp:$sdata/feats.scp ark:- | add-deltas $delta_opts ark:- ark:$dest_dir/$x/delta_deltas.$x.ark
done

echo "Done!"
exit 1;
