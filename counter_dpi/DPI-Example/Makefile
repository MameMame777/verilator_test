rtl_hd := ./dpi_class.svh ./dpi_if.svh 
rtl    := ./dpi_example.sv ./dpi_dut.sv 
c_src  := ./dpi_example.cpp
exec   := run.x
opt    := --binary --trace


run: compile 
	./obj_dir/$(exec)
compile:
	verilator $(opt)  $(c_src) $(rtl_hd) $(rtl) -o $(exec)
clean:
	\rm -rf obj_dir
	\rm -rf ./waveform.vcd 