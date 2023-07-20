CXX = g++
NVCC = nvcc
CXXFLAGS = -Werror -Wextra -Wall -pedantic -std=c++17 -g
NVFLAGS = -Xcompiler -rdynamic -lineinfo
TRASH = main *.o

all: build

.PHONY: build
build:
	$(NVCC) $(NVFLAGS) -c src/Matrix/kernels.cu
	$(CXX) $(CXXFLAGS) -c -I/opt/ohpc/pub/apps/cuda/cuda-11.4/include src/main.cpp
	$(CXX) $(CXXFLAGS) -o main main.o kernels.o -L/usr/local/cuda-5.5/lib64 -lcudart -lcurand -lcuda

.PHONY: run
run: build
	./main

.PHONY: clean
clean:
	$(RM) $(TRASH)
