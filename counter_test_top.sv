module counter_test_top;
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
      fork
        driver.enable_test();
        check.check_count();      
      join
    end : test_
    $display("Finished!");
    $finish;
  end

endmodule