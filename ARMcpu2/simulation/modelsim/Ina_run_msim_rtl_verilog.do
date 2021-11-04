transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Ina {C:/Users/user/Desktop/Verilog/Ina/tdbRam.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Ina {C:/Users/user/Desktop/Verilog/Ina/regFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Ina {C:/Users/user/Desktop/Verilog/Ina/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Ina {C:/Users/user/Desktop/Verilog/Ina/ControlUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/Ina {C:/Users/user/Desktop/Verilog/Ina/tb.v}

