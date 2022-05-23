onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /emdad_mdshahid_02_15_2022_majority/x1
add wave -noupdate /emdad_mdshahid_02_15_2022_majority/x2
add wave -noupdate /emdad_mdshahid_02_15_2022_majority/x3
add wave -noupdate /emdad_mdshahid_02_15_2022_majority/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 118
configure wave -valuecolwidth 68
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
WaveRestoreZoom {0 ps} {869849 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_02_15_2022_majority/x1 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 400ns sim:/emdad_mdshahid_02_15_2022_majority/x1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_02_15_2022_majority/x1 
wave create -driver freeze -pattern clock -initialvalue 1 -period 800ps -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_02_15_2022_majority/x2 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 800ns -dutycycle 50 -starttime 0ns -endtime 800ns Edit:/emdad_mdshahid_02_15_2022_majority/x2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 400ns -dutycycle 50 -starttime 0ns -endtime 800ns Edit:/emdad_mdshahid_02_15_2022_majority/x2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 400ns -dutycycle 50 -starttime 0ns -endtime 800ns Edit:/emdad_mdshahid_02_15_2022_majority/x2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/emdad_mdshahid_02_15_2022_majority/x3 
WaveCollapseAll -1
wave clipboard restore
