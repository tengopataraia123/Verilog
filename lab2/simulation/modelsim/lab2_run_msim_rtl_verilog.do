transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/lab2 {C:/Users/user/Desktop/lab2/shift_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/lab2 {C:/Users/user/Desktop/lab2/tb.v}

