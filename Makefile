CXX := clang++
CFLAGS := -std=c++17 -I./ -lrt -lpthread -O3 -g
PRD_FLAGS := -fpass-plugin=/app/build/bin/PrdPass.so -l:/app/build/bin/tsan-x86_64.a -mclwb -mclflushopt -fuse-ld=gold -z muldefs

all: ALL_CCEH Cuckoo LinearProbing Extendible Level Path

ALL_CCEH: CCEH_MSB CCEH_LSB

test: src/test.cpp CCEH_MSB
	$(CXX) $(CFLAGS) -o bin/single_threaded_cceh src/test.cpp src/CCEH_MSB.o $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -o bin/multi_threaded_cceh src/test.cpp src/CCEH_MSB.o -lpthread -DMULTITHREAD $(PRD_FLAGS)

CCEH_MSB: src/CCEH.h src/CCEH_MSB.cpp
	$(CXX) $(CFLAGS) -c -o src/CCEH_MSB.o src/CCEH_MSB.cpp -DINPLACE $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -c -o src/CCEH_MSB_CoW.o src/CCEH_MSB.cpp $(PRD_FLAGS)
	
CCEH_LSB: src/CCEH.h src/CCEH_LSB.cpp
	$(CXX) $(CFLAGS) -c -o src/CCEH_LSB.o src/CCEH_LSB.cpp -DINPLACE $(PRD_FLAGS)
	$(CXX) $(CFLAGS) -c -o src/CCEH_LSB_CoW.o src/CCEH_LSB.cpp $(PRD_FLAGS)

Cuckoo: src/cuckoo_hash.cpp src/cuckoo_hash.h
	$(CXX) $(CFLAGS) -c src/cuckoo_hash.cpp -o src/cuckoo_hash.o $(PRD_FLAGS)

LinearProbing: src/linear_probing.cpp src/linear_probing.h
	$(CXX) $(CFLAGS) -c src/linear_probing.cpp -o src/linear_probing.o $(PRD_FLAGS)

Extendible: src/extendible_hash.cpp src/extendible_hash.h
	$(CXX) $(CFLAGS) -c src/extendible_hash.cpp -o src/extendible_hash.o $(PRD_FLAGS)

Level: src/Level_hashing.cpp src/Level_hashing.h
	$(CXX) $(CFLAGS) -c src/Level_hashing.cpp -o src/Level_hashing.o $(PRD_FLAGS)

Path: src/path_hashing.cpp src/path_hashing.hpp
	$(CXX) $(CFLAGS) -c src/path_hashing.cpp -o src/path_hashing.o $(PRD_FLAGS)

clean:
	rm -rf src/*.o bin/*
