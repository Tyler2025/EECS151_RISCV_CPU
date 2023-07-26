debImport "-2001" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/ALU_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Branch_Comp_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/PCSrc_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Stall_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Forwarding_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Uart_if_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Cycle_Counters_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Inst_Counters_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/CSR_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/exm_wb_regs_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/WEN_align_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/Data_align_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/ALU.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Data_align.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Branch_comp.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/PCSrc.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Stall.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Cycle_Counters.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Inst_Counters.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/CSR.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/exm_wb_regs.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Forwarding.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/WEN_align.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/Uart_if.v" \
          "sim/ALU_tb.v" "sim/Branch_Comp_tb.v" "sim/CSR_tb.v" \
          "sim/Cycle_Counters_tb.v" "sim/Data_align_tb.v" \
          "sim/exm_wb_regs_tb.v" "sim/Forwarding_tb.v" \
          "sim/Inst_Counters_tb.v" "sim/PCSrc_tb.v" "sim/Stall_tb.v" \
          "sim/Uart_if_tb.v" "sim/WEN_align_tb.v"
debLoadSimResult \
           /home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/EXM/sim/novas.fsdb
wvCreateWindow
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
nsMsgSelect -range {0 23-23}
nsMsgAction -tab cmpl -index {0 23}
nsMsgSelect -range {0 23-23}
nsMsgSwitchTab -tab general
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
srcHBSelect "Data_align_tb.U_DATA_ALIGN_0" -win $_nTrace1
srcHBSelect "Data_align_tb.U_DATA_ALIGN_0" -win $_nTrace1
srcSetScope -win $_nTrace1 "Data_align_tb.U_DATA_ALIGN_0" -delim "."
srcHBSelect "Data_align_tb.U_DATA_ALIGN_0" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvRenameGroup -win $_nWave2 {G1} {U_DATA_ALIGN_0}
wvAddSignal -win $_nWave2 "/Data_align_tb/U_DATA_ALIGN_0/data_in\[31:0\]" \
           "/Data_align_tb/U_DATA_ALIGN_0/MEMWen\[3:0\]" \
           "/Data_align_tb/U_DATA_ALIGN_0/data_out\[31:0\]"
wvSetPosition -win $_nWave2 {("U_DATA_ALIGN_0" 0)}
wvSetPosition -win $_nWave2 {("U_DATA_ALIGN_0" 3)}
wvSetPosition -win $_nWave2 {("U_DATA_ALIGN_0" 3)}
wvSetCursor -win $_nWave2 2968.769137 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1917.330067 -snap {("U_DATA_ALIGN_0" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSetCursor -win $_nWave2 1731.781996 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 2288.426209
wvSetCursor -win $_nWave2 6308.634415
wvSetCursor -win $_nWave2 10143.294550
wvSetCursor -win $_nWave2 13730.557257
wvSetCursor -win $_nWave2 17812.614819
wvSetCursor -win $_nWave2 22389.467238
wvSetCursor -win $_nWave2 25914.880588
wvSetCursor -win $_nWave2 22080.220453
wvSetCursor -win $_nWave2 22080.220453
wvSetCursor -win $_nWave2 22080.220453
wvSetCursor -win $_nWave2 33893.447642
wvSetCursor -win $_nWave2 38037.354562
wvSetCursor -win $_nWave2 42181.261482
wvSetCursor -win $_nWave2 44531.537048
wvSetCursor -win $_nWave2 49974.280465
wvSetCursor -win $_nWave2 53808.940600
wvSetCursor -win $_nWave2 57643.600735
wvSetCursor -win $_nWave2 63519.289651
debExit
