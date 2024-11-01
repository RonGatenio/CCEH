.PHONY: all clean

CXX := clang++
CFLAGS := -O3 -std=c++17 -I./ -lrt -g
PRD_FLAGS := ${PRD_C_FLAGS}

all: test

test: src/test.cpp CCEH
	mkdir -p bin
	$(CXX) $(CFLAGS) -o bin/single_threaded_cceh src/test.cpp bin/CCEH.o -lpmemobj -lpmem $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/multi_threaded_cceh src/test.cpp bin/CCEH.o -lpmemobj -lpmem -lpthread -DMULTITHREAD $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/single_threaded_ccehCoW src/test.cpp bin/CCEH_CoW.o -lpmemobj -lpmem $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/multi_threaded_ccehCoW src/test.cpp bin/CCEH_CoW.o -lpmemobj -lpmem -lpthread -DMULTITHREAD $(PRD_FLAGS)

CCEH: src/CCEH.h src/CCEH.cpp
	mkdir -p bin
	$(CXX) $(CFLAGS) -c -o bin/CCEH.o src/CCEH.cpp -DINPLACE -lpmemobj -lpmem $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -c -o bin/CCEH_CoW.o src/CCEH.cpp -lpmemobj -lpmem $(PRD_FLAGS)
	
clean:
	rm -rf bin/* 
