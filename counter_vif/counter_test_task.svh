  task enable_test_sv();
      driver.enable_test();
  endtask

  task check_count_sv();
    check.check_count();
  endtask