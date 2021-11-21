#include "add_1.cuh"

__global__ void Entry(float* input1, float* input2, float* output1) {
  int tid = threadIdx.x;
  float a = input1[tid];
  float b = input2[tid];
  float c = a + b;
  float d = add_1(c);
  output1[tid] = d;
}

int main() {
  return 0;
}