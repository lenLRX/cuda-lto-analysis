# CUDA LTO analysis
tested cuda version 11.5
## compile
```
./build.sh
g++ nvvm_extractor.cc -o nvvm_extractor
```
## extract nvvm bitcode

```
./nvvm_extractor add_1.lto.o
# output: found magic, start: 900
readelf -a add_1.lto.o
#   [ 6] __nv_relfatbin    PROGBITS         0000000000000000  00000160
#       0000000000000c50  0000000000000000   A       0     0     8
# bitcode size is 0xc50 - 900 + 0x160 -> 2604
dd skip=900 count=2604 if=add_1.lto.o of=add_1.lto.bc bs=1
llvm-dis add_1.lto.bc
cat add_1.lto.ll
```
