interface counter_if(input clk, input rst);
  logic enable;
  logic [31:0] counter;
endinterface