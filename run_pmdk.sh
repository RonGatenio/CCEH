#!/bin/sh

PM_FILE="/tmp/pmem_cceh_data"
NKEYS=10000
NTHREADS=4

rm -f $PM_FILE

PROG=multi_threaded_cceh

OUTPUT=$PROG.trace
echo [*] Executing $PROG '             ' [$OUTPUT]
./CCEH-PMDK/bin/$PROG $PM_FILE $NKEYS $NTHREADS 2> $OUTPUT
cp $OUTPUT ${CPRD_RESULTS_TRACES}

# OUTPUT=$PROG-recovery.trace
# echo [*] Executing $PROG again '       ' [$OUTPUT]
# ./CCEH-PMDK/bin/$PROG $PM_FILE $NKEYS $NTHREADS 2> $OUTPUT
# cp $OUTPUT ${CPRD_RESULTS_TRACES}
