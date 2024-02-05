onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /serialiser_shift_register_tb/UUT/clk
add wave -noupdate /serialiser_shift_register_tb/UUT/rst
add wave -noupdate /serialiser_shift_register_tb/UUT/Shift_en
add wave -noupdate /serialiser_shift_register_tb/UUT/load_en
add wave -noupdate -radix hexadecimal /serialiser_shift_register_tb/UUT/Din
add wave -noupdate /serialiser_shift_register_tb/UUT/Dout
add wave -noupdate -radix binary -childformat {{/serialiser_shift_register_tb/UUT/temp(7) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(6) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(5) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(4) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(3) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(2) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(1) -radix hexadecimal} {/serialiser_shift_register_tb/UUT/temp(0) -radix hexadecimal}} -subitemconfig {/serialiser_shift_register_tb/UUT/temp(7) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(6) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(5) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(4) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(3) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(2) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(1) {-radix hexadecimal} /serialiser_shift_register_tb/UUT/temp(0) {-radix hexadecimal}} /serialiser_shift_register_tb/UUT/temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 256
configure wave -valuecolwidth 64
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {65619434 ps}
