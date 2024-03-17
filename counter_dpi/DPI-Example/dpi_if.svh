interface DUT_IF(input clk, input rst);
  logic [1:0] a;
  logic [1:0] b;

  logic [2:0]  c;
  task  dut_if_display;
    $display("This is a task called from IF and output val is %d.",c);
  endtask
endinterface


