onerror {quit -f}
vlib work
vlog -work work SISTEMA.vo
vlog -work work SISTEMA.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CONTROL_vlg_vec_tst
vcd file -direction SISTEMA.msim.vcd
vcd add -internal CONTROL_vlg_vec_tst/*
vcd add -internal CONTROL_vlg_vec_tst/i1/*
add wave /*
run -all
