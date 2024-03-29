module DUT(DUT_IF dut_if);
  logic [2:0] c_int;

  always_ff @(posedge dut_if.clk or posedge dut_if.rst) begin
    if(dut_if.rst == 1'b1) begin
      c_int <= 3'b000;
    end else begin
      c_int <= dut_if.a + dut_if.b;
    end
  end
  assign dut_if.c[2:0] = c_int[2:0];
endmodule