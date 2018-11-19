# ppgs_maker
make ppgs kaldi implentation
## DNN structure
1. inputs: 13-dim MFCC + deltas + delta-deltas (39-dim total)
2. outputs: 128-dim PPGs
## PPGs maker (4-layer DNN) training
1. cd ppgs_maker/timit/s5;
2. bash run.sh;
3. bash ./local/nnet/run_dnn_deltas.sh;
## Use the ppgs maker to get ppgs
1. cd make_ppgs
2. prepare data (wav.scp, spk2utt, utt2spk,...) as in typical kaldi egs;
3. get mfcc features: bash ./local/make_mfcc_feats.sh;
4. get deltas, delta-deltas features: bash ./local/make_delta_feats.sh;
5. get PPGs: bash ./local/run_dnn_forward.sh;
6. save PPGs to python dict: bash ./local/make_all_ppgs.sh.
## Before running
1. prepare data;
2. modify PPGs dimension by modifing the numLeavesTri1 and numGaussTri1 in ppgs_maker/timit/s5/run.sh;
3. modify variables relates to path;
4. modify the network structure by：
(1) modifing --nn-depth and --hid-dim in ppgs_maker/timit/s5/local/nnet/run_dnn_deltas.sh, line 58;
(2) modifing the number before .dbn to the number of layers of the DNN.
