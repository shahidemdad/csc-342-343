onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /emdad_23rdmarch2022_lpm_ram_32x32/Emdad_23rdMarch2022_address
add wave -noupdate -radix hexadecimal /emdad_23rdmarch2022_lpm_ram_32x32/Emdad_23rdMarch2022_clock
add wave -noupdate -radix hexadecimal /emdad_23rdmarch2022_lpm_ram_32x32/Emdad_23rdMarch2022_data
add wave -noupdate -radix hexadecimal /emdad_23rdmarch2022_lpm_ram_32x32/Emdad_23rdMarch2022_wren
add wave -noupdate -radix hexadecimal /emdad_23rdmarch2022_lpm_ram_32x32/Emdad_23rdMarch2022_q
add wave -noupdate -radix hexadecimal /emdad_23rdmarch2022_lpm_ram_32x32/Emdad_23rdMarch2022_sub_wire0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {650 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 416
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {2940 ps}
