
#include <stdio.h>
#include "svdpi.h"
#include "Vdpi_example__Dpi.h"
extern void sv_task_display();
extern void sv_task_display_arg(int a, int b);
extern void sv_task_val_set(int a, int b);
extern void sv_judge(int a, int b, int* c);
extern void dut_if_display();
extern void dipslay_class();




int c_function(int in) {
  printf("This is a C function called from SystemVerilog with input: %d\n", in);
  sv_task_display();
  int a = 10;
  int b = 20;
  int result;
  sv_task_display_arg(a, b);
  sv_task_val_set(2, 2);
  sv_task_judge(2, 2, &result);
  dut_if_display();
  dipslay_class();
  return in * 2;
}