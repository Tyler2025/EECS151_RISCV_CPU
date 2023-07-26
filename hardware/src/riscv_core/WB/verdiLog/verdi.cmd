debImport "-2001" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/WB/sim/LDX_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/WB/LDX.v" \
          "sim/LDX_tb.v"
debLoadSimResult \
           /home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/WB/sim/novas.fsdb
wvCreateWindow
srcHBSelect "LDX_tb.U_LDX_0" -win $_nTrace1
srcSetScope -win $_nTrace1 "LDX_tb.U_LDX_0" -delim "."
srcHBSelect "LDX_tb.U_LDX_0" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvRenameGroup -win $_nWave2 {G1} {U_LDX_0}
wvAddSignal -win $_nWave2 "/LDX_tb/U_LDX_0/LDSel\[2:0\]" \
           "/LDX_tb/U_LDX_0/memdout\[31:0\]" "/LDX_tb/U_LDX_0/address\[31:0\]" \
           "/LDX_tb/U_LDX_0/ldout\[31:0\]"
wvSetPosition -win $_nWave2 {("U_LDX_0" 0)}
wvSetPosition -win $_nWave2 {("U_LDX_0" 4)}
wvSetPosition -win $_nWave2 {("U_LDX_0" 4)}
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 15201.685731 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1763.395545
verdiDockWidgetRestore -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 1763.395545
wvSetCursor -win $_nWave2 25842.865744
wvSetCursor -win $_nWave2 25842.865744
wvSetCursor -win $_nWave2 30099.337748
wvSetCursor -win $_nWave2 65853.702589
wvSetCursor -win $_nWave2 69684.527393
wvSetCursor -win $_nWave2 69684.527393
wvSetCursor -win $_nWave2 78440.698374
wvSetCursor -win $_nWave2 81663.455750
wvSetCursor -win $_nWave2 81663.455750
wvSetCursor -win $_nWave2 81663.455750
wvSetCursor -win $_nWave2 85980.734497
wvSetCursor -win $_nWave2 89629.139073
wvSetCursor -win $_nWave2 93885.611078
wvSetCursor -win $_nWave2 97594.822396
wvSetCursor -win $_nWave2 97594.822396
wvSetCursor -win $_nWave2 97594.822396
wvSetCursor -win $_nWave2 108236.367614
wvSetCursor -win $_nWave2 109574.115958
wvSetCursor -win $_nWave2 111398.318246
wvSetCursor -win $_nWave2 111884.772189 -snap {("U_LDX_0" 2)}
wvSetCursor -win $_nWave2 79535.584953 -snap {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSetCursor -win $_nWave2 112067.192418 -snap {("U_LDX_0" 3)}
wvSetCursor -win $_nWave2 87258.041304 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 117843.832996
wvSetCursor -win $_nWave2 121857.078029
wvSetCursor -win $_nWave2 121857.078029
wvSetCursor -win $_nWave2 125870.323062
wvSetCursor -win $_nWave2 122161.111744
wvSetCursor -win $_nWave2 122161.111744
wvSetCursor -win $_nWave2 122161.111744
wvSetCursor -win $_nWave2 130248.408553
wvSetCursor -win $_nWave2 133227.938956
wvSetCursor -win $_nWave2 116689.454415 -snap {("U_LDX_0" 4)}
wvSetCursor -win $_nWave2 117844.782531
wvSetCursor -win $_nWave2 126053.692826
wvSetCursor -win $_nWave2 129884.517630
wvSetCursor -win $_nWave2 133472.115463
wvSetCursor -win $_nWave2 145815.884277
wvSetCursor -win $_nWave2 149768.322567
wvSetCursor -win $_nWave2 174151.826480
wvSetCursor -win $_nWave2 186130.754837
wvSetCursor -win $_nWave2 189231.898726
wvSetCursor -win $_nWave2 195191.324738
wvSetCursor -win $_nWave2 201028.772059
wvSetCursor -win $_nWave2 214284.642017
debExit
