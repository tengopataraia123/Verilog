transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/sdsubus3 {C:/Users/user/Desktop/Verilog/sdsubus3/tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Verilog/sdsubus3 {C:/Users/user/Desktop/Verilog/sdsubus3/sdsubus.v}

