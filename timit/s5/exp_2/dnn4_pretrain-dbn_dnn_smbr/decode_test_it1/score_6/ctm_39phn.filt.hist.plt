set samples 1000
set xrange [0.000000:1.000000]
set autoscale y
set size 0.78, 1.0
set nogrid
set ylabel 'Counts'
set xlabel 'Confidence Measure'
set title  'Confidence scores for exp_2/dnn4_pretrain-dbn_dnn_smbr/decode_test_it1/score_6/ctm_39phn.filt'
plot 'exp_2/dnn4_pretrain-dbn_dnn_smbr/decode_test_it1/score_6/ctm_39phn.filt.hist.dat' using 1:2 '%f%f' title 'All Conf.' with lines, \
     'exp_2/dnn4_pretrain-dbn_dnn_smbr/decode_test_it1/score_6/ctm_39phn.filt.hist.dat' using 1:2 '%f%*s%f' title 'Correct Conf.' with lines, \
     'exp_2/dnn4_pretrain-dbn_dnn_smbr/decode_test_it1/score_6/ctm_39phn.filt.hist.dat' using 1:2 '%f%*s%*s%f' title 'Incorrect Conf.' with lines
set size 1.0, 1.0
