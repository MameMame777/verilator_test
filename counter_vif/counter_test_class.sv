class counter_test_driver;
  virtual counter_if ifc;

  function new(virtual counter_if ifc);
    this.ifc = ifc;
  endfunction
  
  task reset_test();
    // count_reset
    ifc.rst <= 1'b1;
    #10;
    ifc.rst <= 1'b0;
    #10;
  endtask

  task enable_test();
    // count start
    ifc.enable <= 1'b1;
  endtask

endclass  

class counter_test_checker;
  virtual counter_if ifc;
  logic [31:0] expected_count;

  function new(virtual counter_if ifc);
    this.ifc = ifc;
    this.expected_count = 0;
  endfunction

  task check_count();
    if (ifc.counter !== expected_count) begin
      $display("Test failed: expected %0d, got %0d", expected_count, ifc.counter);
    end else begin
      $display("Test passed: expected %0d, got %0d", expected_count, ifc.counter);
    end
    #10
    expected_count = expected_count + 1;  // Update the expected count for the next test
  endtask
endclass