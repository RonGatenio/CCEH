#!/bin/sh

mkdir CCEH-PMDK/bin
(cd CCEH-PMDK && make clean && make)

mkdir bin
make clean && make test

if [ ! -z "$CPRD_RESULTS_BIN" ]; then
    cp CCEH-PMDK/bin/* $CPRD_RESULTS_BIN
fi
