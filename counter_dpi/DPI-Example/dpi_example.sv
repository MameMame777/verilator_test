
module top;

  import "DPI-C" context function int c_function(int in);
  export "DPI-C"  task sv_task_display;
  export "DPI-C"  task sv_task_display_arg;
  export "DPI-C"  task sv_task_val_set;
  export "DPI-C"  task sv_task_judge;
  
  logic clk;
  logic reset;
  // Clock generation
  always #5 clk = ~clk;
  
  // Instantiate the interface
  DUT_IF DUT_IF(.clk(clk), .rst(reset));

  // Instantiate the DUT
  DUT DUT(DUT_IF);
  int in = 10;
  int out;

  task  sv_task_display;
    $display("This is a SystemVerilog task called from C.");
  endtask

  task sv_task_display_arg(input int a, input int b);
    $display("This is a SystemVerilog task called from C with arguments: %d %d", a, b);
  endtask
  
  task sv_task_val_set(input int a, input int b);
    DUT_IF.a[1:0] = a[1:0];
    DUT_IF.b[1:0] = b[1:0];
  endtask

  task sv_task_judge(input int val=32'h0, input int exp=32'h0, output int result );
    if(val == exp) begin
      result[0] = 1;
      $display("*** Test passed exp %d, val %d", exp, val);
    end else begin
      result[0] = 0;
      $display("Test failed *** exp%d, val %d", exp, val);
    end
  endtask
  initial begin
    $display("Output from C function: %d", out);
    out = c_function(in);
    $finish;
  end


endmodule