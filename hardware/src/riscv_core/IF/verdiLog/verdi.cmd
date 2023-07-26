debImport "-2001" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/IF/pc_reg.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/IF/sim/pc_reg_tb.v" \
          "sim/pc_reg_tb.v"
debLoadSimResult \
           /home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/IF/sim/novas.fsdb
wvCreateWindow
srcHBDrag -win $_nTrace1
wvRenameGroup -win $_nWave2 {G1} {pc_reg_tb}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 13041.690793
wvSelectGroup -win $_nWave2 {pc_reg_tb}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "pc_reg_tb.U_PC_REG_0" -win $_nTrace1
srcSetScope -win $_nTrace1 "pc_reg_tb.U_PC_REG_0" -delim "."
srcHBSelect "pc_reg_tb.U_PC_REG_0" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvRenameGroup -win $_nWave2 {G1} {U_PC_REG_0}
wvAddSignal -win $_nWave2 "/pc_reg_tb/U_PC_REG_0/clk" \
           "/pc_reg_tb/U_PC_REG_0/pcsrc\[1:0\]" \
           "/pc_reg_tb/U_PC_REG_0/alu_addr\[31:0\]" \
           "/pc_reg_tb/U_PC_REG_0/pc\[31:0\]" \
           "/pc_reg_tb/U_PC_REG_0/next_pc\[31:0\]"
wvSetPosition -win $_nWave2 {("U_PC_REG_0" 0)}
wvSetPosition -win $_nWave2 {("U_PC_REG_0" 5)}
wvSetPosition -win $_nWave2 {("U_PC_REG_0" 5)}
wvSetCursor -win $_nWave2 4620.547146 -snap {("G2" 0)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 91496.201052 113927.527762
wvSetCursor -win $_nWave2 99978.415185 -snap {("U_PC_REG_0" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "U_PC_REG_0" 3 )} 
wvSelectSignal -win $_nWave2 {( "U_PC_REG_0" 2 )} 
wvSetCursor -win $_nWave2 110976.037405 -snap {("U_PC_REG_0" 2)}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 143442.431327 -snap {("U_PC_REG_0" 2)}
wvSetCursor -win $_nWave2 99170.075979 -snap {("U_PC_REG_0" 2)}
wvZoom -win $_nWave2 99170.075979 119240.210403
wvSetCursor -win $_nWave2 100999.965500 -snap {("U_PC_REG_0" 5)}
wvSetCursor -win $_nWave2 99979.450190 -snap {("U_PC_REG_0" 5)}
wvSetCursor -win $_nWave2 100964.775317 -snap {("U_PC_REG_0" 5)}
wvSetCursor -win $_nWave2 102994.075875 -snap {("U_PC_REG_0" 5)}
wvSelectSignal -win $_nWave2 {( "U_PC_REG_0" 4 )} 
debExit
