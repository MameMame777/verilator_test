module counter_test_top;

  `include "counter_test.svh"
  `include "counter_test_task.svh"
  
  bit clk = 0;
  always #5 clk = ~clk;
  logic rst;

  counter_if ifc(clk,rst);
  counter counter_inst(ifc);

  counter_test_driver driver = new(ifc);
  counter_test_checker check = new(ifc);



  initial begin
    driver.reset_test();
    repeat(10) begin : test_ 
    
    enable_test();
    check_count();
    #10;
    
    end : test_
    $display("Finished!");
    $finish;
  end

endmodule