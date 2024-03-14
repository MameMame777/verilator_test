
module top;

  import "DPI-C" context function int c_function(int in);
  export "DPI-C"  task sv_task;
  
  int in = 10;
  int out;

  task  sv_task;
    $display("This is a SystemVerilog task called from C.");
  endtask
  
  initial begin
    out = c_function(in);
    $display("Output from C function: %d", out);
    sv_task();
    $finish;
  end


endmodule