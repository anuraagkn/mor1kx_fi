TARGET           := mor1kx-net-test_0
VPI_MODULES      := elf-loader_1.0.2.vpi jtag_vpi.vpi
TOPLEVEL         := orpsoc_tb
IVERILOG_OPTIONS := -DSIM
EXTRA_OPTIONS    ?= +elf_load=/home/anuraag/or1k/hello.elf +trace_enable=1 +vcd=1

all: $(VPI_MODULES) $(TARGET)

$(TARGET):
	iverilog -s$(TOPLEVEL) -c $(TARGET).scr -o $@ $(IVERILOG_OPTIONS)

run: $(VPI_MODULES) $(TARGET)
	vvp -n -M. -l icarus.log -lxt2 $(patsubst %.vpi,-m%,$(VPI_MODULES)) $(TARGET) $(EXTRA_OPTIONS)

clean:
	$(RM) $(VPI_MODULES) $(TARGET)

elf-loader_1.0.2_LIBS := -lelf
elf-loader_1.0.2_INCS := -I../src/elf-loader_1.0.2/
elf-loader_1.0.2_SRCS := ../src/elf-loader_1.0.2/elf-loader.c ../src/elf-loader_1.0.2/vpi_wrapper.c

elf-loader_1.0.2.vpi: $(elf-loader_1.0.2_SRCS)
	iverilog-vpi --name=elf-loader_1.0.2 $(elf-loader_1.0.2_LIBS) $(elf-loader_1.0.2_INCS) $?

clean_elf-loader_1.0.2:
	$(RM) elf-loader_1.0.2.vpi

jtag_vpi_LIBS := 
jtag_vpi_INCS := -I../src/jtag_vpi_0-r4/
jtag_vpi_SRCS := ../src/jtag_vpi_0-r4/jtag_common.c ../src/jtag_vpi_0-r4/jtag_vpi.c ../src/jtag_vpi_0-r4/jtag_vpi.v

jtag_vpi.vpi: $(jtag_vpi_SRCS)
	iverilog-vpi --name=jtag_vpi $(jtag_vpi_LIBS) $(jtag_vpi_INCS) $?

clean_jtag_vpi:
	$(RM) jtag_vpi.vpi
