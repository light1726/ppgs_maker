#!/usr/bin/python

import numpy as np
import pickle as pkl
import codecs
import argparse


def ppgs2dict(filename):
    ppgs_dict=dict()
    with codecs.open(filename, 'rb', 'utf-8') as f:
        utt = ''
        for line in f:
            lst = line.split()
            frame = list()
            if '[' in line:
                utt = lst[0]
                ppgs_dict[utt]=[] 
            else:
                frame = [float(lst[i]) for i in range(128)]
                ppgs_dict[utt].append(frame)
    return ppgs_dict


def main():
    ap = argparse.ArgumentParser(description='save ppgs to pickle')
    ap.add_argument('-f', '--file', required=True, help='ppgs path')
    ap.add_argument('-d', '--dest', required=True, help='save path')
    args = vars(ap.parse_args())
    ppgs_path = args['file']
    save_dir = args['dest']
    ppgs_dict = ppgs2dict(ppgs_path)
    with open(save_dir+'/ppgs_dict', 'wb') as f:
        pkl.dump(ppgs_dict, f, protocol=pkl.HIGHEST_PROTOCOL)


if __name__ == '__main__':
    main()

