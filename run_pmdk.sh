#!/bin/sh

rm -f /tmp/data

./CCEH-PMDK/bin/multi_threaded_cceh /tmp/data 10 4
