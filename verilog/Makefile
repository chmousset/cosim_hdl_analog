V_TB:= $(wildcard *_tb.v)
V_SRC:= $(filter-out $(TV_B), $(wildcard *.v))
VCD:= $(subst .v,.vcd, $(V_TB))

# override parameters passed to iverilog
# IV_OVR=

all: sim

checkpath:
	@echo "V_TB:" $(V_TB)
	@echo "V_SRC:" $(V_SRC)
	@echo "VCD" $(VCD)

clean:
	-rm -f *.vcd *.vvp *.log


%.vcd: %.vvp
	@echo "running vvp" $^
	vvp $^ -l %.log

%.vvp: %.v $(V_SRC)
	iverilog -o $@ $^ -D 'DUMP_FILE_NAME="$(subst .vvp,.vcd,$@)"' $(IV_OVR)
	@echo "building simulator" $@

sim: $(VCD)
