export KALDI_ROOT=/opt/kaldi
[ -f /home/lh17/tools/env.sh ] && . /home/lh17/tools/env.sh
export PATH=$PWD/utils/:/home/lh17/tools/openfst/bin:/home/lh17/tools/irstlm/bin/:/home/lh17/tools/sctk/bin:$PWD:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/lh17/tools/openfst/lib
[ ! -f $KALDI_ROOT/tools/config/common_path.sh ] && echo >&2 "The standard file $KALDI_ROOT/tools/config/common_path.sh is not present -> Exit!" && exit 1
. $KALDI_ROOT/tools/config/common_path.sh
export LC_ALL=C
