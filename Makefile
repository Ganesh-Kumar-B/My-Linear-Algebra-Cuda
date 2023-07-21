CXX = g++
NVCC = nvcc
CXXFLAGS = -Werror -Wextra -Wall -pedantic -std=c++17 -g 
NVFLAGS = -Xcompiler -rdynamic -lineinfo 
TRASH = main *.o

all: build

.PHONY: build
build:
	$(NVCC) $(NVFLAGS) -c src/Matrix/kernels.cu
	$(CXX) $(CXXFLAGS) -c -I/opt/nvidia/hpc_sdk/Linux_x86_64/22.11/cuda/11.8/include src/main.cpp
	$(CXX) $(CXXFLAGS) -o main main.o kernels.o -L/opt/nvidia/hpc_sdk/Linux_x86_64/22.11/cuda/11.8/lib/ -lcudart

.PHONY: run
run: build
	./main

.PHONY: clean
clean:
	$(RM) $(TRASH)
