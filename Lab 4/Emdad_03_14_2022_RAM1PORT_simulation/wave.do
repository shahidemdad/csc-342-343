onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /emdad_14thmarch_ram1port/clock
add wave -noupdate /emdad_14thmarch_ram1port/wren
add wave -noupdate /emdad_14thmarch_ram1port/data
add wave -noupdate -radix hexadecimal /emdad_14thmarch_ram1port/address
add wave -noupdate /emdad_14thmarch_ram1port/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {566 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
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
WaveRestoreZoom {0 ps} {2100 ps}
