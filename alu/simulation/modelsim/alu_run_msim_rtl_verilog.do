transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/alu {C:/Users/user/Desktop/Verilog/alu/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/alu {C:/Users/user/Desktop/Verilog/alu/tb.v}

