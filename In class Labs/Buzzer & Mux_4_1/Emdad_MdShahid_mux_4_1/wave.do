onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /emdad_mdshahid_mux_4_1/sel
add wave -noupdate /emdad_mdshahid_mux_4_1/A
add wave -noupdate /emdad_mdshahid_mux_4_1/B
add wave -noupdate /emdad_mdshahid_mux_4_1/C
add wave -noupdate /emdad_mdshahid_mux_4_1/D
add wave -noupdate /emdad_mdshahid_mux_4_1/Z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {171084 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 183
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {859036 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 00 -range 2 1 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_mux_4_1/sel 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 1 -period 800ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_mux_4_1/A 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_mux_4_1/B 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 800ns -dutycycle 50 -starttime 0ns -endtime 800ns Edit:/emdad_mdshahid_mux_4_1/A 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_mux_4_1/C 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 800ns Edit:/emdad_mdshahid_mux_4_1/C 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_mux_4_1/D 
WaveCollapseAll -1
wave clipboard restore
