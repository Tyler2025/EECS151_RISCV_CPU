debImport "-2001" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/sim/immgen_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/sim/control_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/sim/id_exm_regs_tb.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/immgen.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/control.v" \
          "/home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/id_exm_regs.v" \
          "sim/control_tb.v" "sim/id_exm_regs_tb.v" "sim/immgen_tb.v"
debLoadSimResult \
           /home/ICer/Project/project_skeleton_sp22/hardware/src/riscv_core/ID/sim/novas.fsdb
wvCreateWindow
srcHBSelect "id_exm_regs_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "id_exm_regs_tb" -delim "."
srcHBSelect "id_exm_regs_tb" -win $_nTrace1
srcHBSelect "id_exm_regs_tb.U_ID_EXM_REGS_0" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvRenameGroup -win $_nWave2 {G1} {U_ID_EXM_REGS_0}
wvAddSignal -win $_nWave2 "/id_exm_regs_tb/U_ID_EXM_REGS_0/clk" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/pc\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/rs1\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/rs2\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/imm\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/BrUn" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/BSel" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/ASel" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/ALUSel\[3:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/MEMWen\[3:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/CSRSrc" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/LDSel\[2:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/WBSel\[1:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/RegWen" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/Inst\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/pc_o\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/rs1_o\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/rs2_o\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/imm_o\[31:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/BrUn_o" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/BSel_o" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/ASel_o" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/ALUSel_o\[3:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/MEMWen_o\[3:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/CSRSrc_o" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/LDSel_o\[2:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/WBSel_o\[1:0\]" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/RegWen_o" \
           "/id_exm_regs_tb/U_ID_EXM_REGS_0/Inst_o\[31:0\]"
wvSetPosition -win $_nWave2 {("U_ID_EXM_REGS_0" 0)}
wvSetPosition -win $_nWave2 {("U_ID_EXM_REGS_0" 29)}
wvSetPosition -win $_nWave2 {("U_ID_EXM_REGS_0" 29)}
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4002.476780 -snap {("U_ID_EXM_REGS_0" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 5003.095975 -snap {("U_ID_EXM_REGS_0" 23)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
debExit
