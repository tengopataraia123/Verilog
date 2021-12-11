transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/lab5 {C:/Users/user/Desktop/Verilog/lab5/counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/lab5 {C:/Users/user/Desktop/Verilog/lab5/displayControler.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/lab5 {C:/Users/user/Desktop/Verilog/lab5/numParser.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/lab5 {C:/Users/user/Desktop/Verilog/lab5/tb.v}

