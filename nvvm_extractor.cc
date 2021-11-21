#include <cstdint>
#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
  if (argc != 2) {
    std::cerr << "usage: ./nvvm_extractor object_to_extract" << std::endl;
    return -1;
  }

  std::streamoff scan_offset = 0;

  int bc_found;
  const uint32_t llvm_bc_magic = 0xDEC04342;
  std::ifstream input(argv[1], std::ios::binary);
  uint32_t test_val;
  while (input.read((char*)&test_val, sizeof(uint32_t))) {
    if (test_val == llvm_bc_magic) {
      std::cout << "found magic, start: " << scan_offset << std::endl;
      ++bc_found;
    }
    ++scan_offset;
    input.seekg(scan_offset, std::ios_base::beg);
  }

}