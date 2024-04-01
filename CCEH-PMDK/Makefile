.PHONY: all clean

CXX := clang++
CFLAGS := -O3 -std=c++17 -I./ -lrt -g
PRD_FLAGS := -fpass-plugin=/app/build/bin/PrdPass.so -l:/app/build/bin/cprd-x86_64.a -mclwb -mclflushopt -fuse-ld=gold -z muldefs

all: test

test: src/test.cpp CCEH
	$(CXX) $(CFLAGS) -o bin/single_threaded_cceh src/test.cpp src/CCEH.o -lpmemobj -lpmem $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/multi_threaded_cceh src/test.cpp src/CCEH.o -lpmemobj -lpmem -lpthread -DMULTITHREAD $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/single_threaded_ccehCoW src/test.cpp src/CCEH_CoW.o -lpmemobj -lpmem $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/multi_threaded_ccehCoW src/test.cpp src/CCEH_CoW.o -lpmemobj -lpmem -lpthread -DMULTITHREAD $(PRD_FLAGS)

CCEH: src/CCEH.h src/CCEH.cpp
	$(CXX) $(CFLAGS) -c -o src/CCEH.o src/CCEH.cpp -DINPLACE -lpmemobj -lpmem $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -c -o src/CCEH_CoW.o src/CCEH.cpp -lpmemobj -lpmem $(PRD_FLAGS)
	
clean:
	rm -rf src/*.o bin/* 
