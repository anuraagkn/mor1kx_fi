iverilog-vpi --name=elf-loader_1.0.2 -lelf -I../src/elf-loader_1.0.2/ ../src/elf-loader_1.0.2/elf-loader.c ../src/elf-loader_1.0.2/vpi_wrapper.c
wait
iverilog-vpi --name=jtag_vpi  -I../src/jtag_vpi_0-r4/ ../src/jtag_vpi_0-r4/jtag_common.c ../src/jtag_vpi_0-r4/jtag_vpi.c ../src/jtag_vpi_0-r4/jtag_vpi.v
wait
iverilog -sorpsoc_tb -c mor1kx-net-test_0.scr -o mor1kx-net-test_0 -DSIM
wait
vvp -n -M. -l icarus.log -lxt2 -melf-loader_1.0.2 -mjtag_vpi mor1kx-net-test_0 +elf_load=/home/anuraag/or1k/hello.elf +trace_enable=1 +vcd=1
