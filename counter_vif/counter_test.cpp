#include <stdio.h>
#include "svdpi.h"
#include "Vcounter_test_class__Dpi.h"
extern void enable_test_sv();
extern void check_count_sv();


void enable_test() {
  enable_test_sv();
}

void check_count() {
  check_count_sv();
}
