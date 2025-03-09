quartus_sh -t "/home/user/.local/intelFPGA_lite/17.1/quartus/common/tcl/internal/nativelink/qnativesim.tcl" --gen_script --rtl_sim "intel_max10" "intel_max10"
vsim -do "simulation/modelsim/intel_max10_run_msim_rtl_vhdl.do"
