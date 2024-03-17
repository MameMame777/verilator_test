module counter_test_top;

  export "DPI-C"    task enable_test_sv;
  export "DPI-C"    task check_count_sv;
  import "DPI-C" context function void enable_test();
  import "DPI-C" context function void check_count();

  bit clk = 0;
  always #5 clk = ~clk;


  logic rst;

  counter_if ifc(clk,rst);
  counter counter_inst(ifc);

  counter_test_driver driver = new(ifc);
  counter_test_checker check = new(ifc);

  task enable_test_sv();
      driver.enable_test();
  endtask

  task check_count_sv();
    check.check_count();
  endtask

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