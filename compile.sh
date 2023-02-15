#!/bin/sh

(cd CCEH-PMDK && make clean && make)

make clean && make test
