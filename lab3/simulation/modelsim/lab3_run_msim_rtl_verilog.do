transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/lab3 {C:/Users/user/Desktop/Verilog/lab3/GCD.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/lab3 {C:/Users/user/Desktop/Verilog/lab3/tb.v}

