transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Lab#1 {C:/Users/user/Desktop/Verilog/Lab#1/de0_nano_soc_baseline.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Lab#1 {C:/Users/user/Desktop/Verilog/Lab#1/tb.v}

