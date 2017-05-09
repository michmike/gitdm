#!/bin/sh
PWD=`pwd`
FNP=$PWD/run_no_map_patch
FNN=$PWD/run_no_map_numstat
cd ~/dev/go/src/k8s.io/kubernetes/
git config merge.renameLimit 10000
git config diff.renameLimit 10000
# -m --> map unknowns to 'DomainName *' , -u map unknowns to '(Unknown)'
git log -p -M | ~/dev/cncf/gitdm/cncfdm.py -b ~/dev/cncf/gitdm/ -t -z -d -D -U -h $FNP.html -o $FNP.txt -x $FNP.csv
git log --numstat -M | ~/dev/cncf/gitdm/cncfdm.py -n -b ~/dev/cncf/gitdm/ -t -z -d -D -U -h $FNN.html -o $FNN.txt -x $FNN.csv > $FNN.out
git config --unset diff.renameLimit
git config --unset merge.renameLimit
cd $PWD
