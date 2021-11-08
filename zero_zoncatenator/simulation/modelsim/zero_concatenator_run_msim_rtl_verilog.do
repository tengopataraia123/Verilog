transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/zero_zoncatenator {C:/Users/user/Desktop/Verilog/zero_zoncatenator/concatenator.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/zero_zoncatenator {C:/Users/user/Desktop/Verilog/zero_zoncatenator/tb.v}

