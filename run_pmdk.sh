#!/bin/sh

PM_FILE="/tmp/pmem_cceh_data"
NKEYS=100
NTHREADS=4

rm -f $PM_FILE

PROG=multi_threaded_cceh

OUTPUT=$PROG.trace
echo [*] Executing $PROG '             ' [$OUTPUT]
./CCEH-PMDK/bin/$PROG $PM_FILE $NKEYS $NTHREADS 2> $OUTPUT

OUTPUT=$PROG-recovery.trace
echo [*] Executing $PROG again '       ' [$OUTPUT]
./CCEH-PMDK/bin/$PROG $PM_FILE $NKEYS $NTHREADS 2> $OUTPUT
