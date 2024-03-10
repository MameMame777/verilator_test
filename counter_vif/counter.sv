module counter (counter_if counter);
  logic [31:0] counter_int;
  logic en,rst;


  always_ff @(posedge counter.clk or posedge counter.rst) begin
    if(counter.rst == 1'b1) begin
      counter_int <= 32'd0;
    end else begin
      if(counter.enable== 1'b1) begin
        counter_int <= counter_int + 1;
      end
    end
  end
  assign counter.counter = counter_int;

endmodule
