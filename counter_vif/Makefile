rtl    := ./counter.sv
if      :=./counter_if.sv
verif  := ./counter_test_class.sv  ./counter_test_top.sv  
exec   := run.x
opt    := --binary --trace

run: compile
	./obj_dir/$(exec)

compile:
	verilator $(opt) +incdir+ $(verif) $(rtl) $(interface) -o $(exec)

clean:
	\rm -rf obj_dir
	\rm -rf ./waveform.vcd 