
#include <stdio.h>
#include "svdpi.h"
#include "Vdpi_example__Dpi.h"
extern void sv_task();

int c_function(int in) {
  printf("This is a C function called from SystemVerilog with input: %d\n", in);
  sv_task();
  return in * 2;
}