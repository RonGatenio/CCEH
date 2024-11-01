#!/bin/sh

mkdir CCEH-PMDK/bin

cd CCEH-PMDK
make -j 2> /dev/null

if [ ! -z "$CPRD_RESULTS_BIN" ]; then
    cp bin/* $CPRD_RESULTS_BIN
fi
