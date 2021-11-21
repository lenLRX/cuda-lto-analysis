export ARCH=sm_80
nvcc -arch=$ARCH -dc entry.cu -o entry.nolto.o
nvcc -arch=$ARCH -dc add_1.cu -o add_1.nolto.o
nvcc -arch=$ARCH entry.nolto.o add_1.nolto.o -o test.nolto.exe

nvcc -arch=$ARCH  -Xcompiler -fPIC -dc -dlto -no-compress entry.cu -o entry.lto.o
nvcc -arch=$ARCH  -Xcompiler -fPIC -dc -dlto -no-compress add_1.cu -o add_1.lto.o
nvcc -arch=$ARCH -dlto entry.lto.o add_1.lto.o -o test.lto.exe
nvcc --shared -arch=$ARCH -dlto entry.lto.o add_1.lto.o -o test.lto.so
