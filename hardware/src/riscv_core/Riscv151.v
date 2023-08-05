module Riscv151 #(
  parameter CPU_CLOCK_FREQ = 50_000_000,
  parameter RESET_PC       = 32'h4000_0000,
  parameter BAUD_RATE      = 115200,
  parameter BIOS_MIF_HEX   = "bios151v3.mif"
) (
  input  clk,
  input  rst,
  input  FPGA_SERIAL_RX,
  output FPGA_SERIAL_TX,
  output [31:0] csr
);
  // Memories
  localparam BIOS_AWIDTH = 11;
  localparam BIOS_DWIDTH = 32;

  wire [BIOS_AWIDTH-1:0] bios_addra, bios_addrb;
  wire [BIOS_DWIDTH-1:0] bios_douta, bios_doutb;

  // BIOS Memory
  // Synchronous read: read takes one cycle
  // Synchronous write: write takes one cycle
  SYNC_ROM_DP #(
    .AWIDTH(BIOS_AWIDTH),
    .DWIDTH(BIOS_DWIDTH),
    .MIF_HEX(BIOS_MIF_HEX)
  ) bios_mem(
    .q0(bios_douta),    // output
    .addr0(bios_addra), // input
    .en0(1'b1),

    .q1(bios_doutb),    // output
    .addr1(bios_addrb), // input
    .en1(1'b1),

    .clk(clk)
  );

  localparam DMEM_AWIDTH = 14;
  localparam DMEM_DWIDTH = 32;

  wire [DMEM_AWIDTH-1:0] dmem_addra;
  wire [DMEM_DWIDTH-1:0] dmem_dina, dmem_douta;
  wire [3:0] dmem_wea;

  // Data Memory
  // Synchronous read: read takes one cycle
  // Synchronous write: write takes one cycle
  // Write-byte-enable: select which of the four bytes to write
  SYNC_RAM_WBE #(
    .AWIDTH(DMEM_AWIDTH),
    .DWIDTH(DMEM_DWIDTH)
  ) dmem (
    .q(dmem_douta),    // output
    .d(dmem_dina),     // input
    .addr(dmem_addra), // input
    .wbe(dmem_wea),    // input
    .en(1'b1),
    .clk(clk)
  );

  localparam IMEM_AWIDTH = 14;
  localparam IMEM_DWIDTH = 32;

  wire [IMEM_AWIDTH-1:0] imem_addra, imem_addrb;
  wire [IMEM_DWIDTH-1:0] imem_douta, imem_doutb;
  wire [IMEM_DWIDTH-1:0] imem_dina, imem_dinb;
  wire [3:0] imem_wea, imem_web;

  // Instruction Memory
  // Synchronous read: read takes one cycle
  // Synchronous write: write takes one cycle
  // Write-byte-enable: select which of the four bytes to write
  SYNC_RAM_DP_WBE #(
    .AWIDTH(IMEM_AWIDTH),
    .DWIDTH(IMEM_DWIDTH)
  ) imem (
    .q0(imem_douta),    // output
    .d0(imem_dina),     // input
    .addr0(imem_addra), // input
    .wbe0(imem_wea),    // input
    .en0(1'b1),

    .q1(imem_doutb),    // output
    .d1(imem_dinb),     // input
    .addr1(imem_addrb), // input
    .wbe1(imem_web),    // input
    .en1(1'b1),

    .clk(clk)
  );

  wire rf_we;
  wire [4:0]  rf_ra1, rf_ra2, rf_wa;
  wire [31:0] rf_wd;
  wire [31:0] rf_rd1, rf_rd2;

  // Register Files
  // Asynchronous read: read data is available in the same cycle
  // Synchronous write: write takes one cycle
  REG_FILES # (
    .AWIDTH(5),
    .DWIDTH(32)
  ) rf (
    .d0(rf_wd),     // input
    .addr0(rf_wa),  // input
    .we0(rf_we),    // input

    .q1(rf_rd1),    // output
    .addr1(rf_ra1), // input

    .q2(rf_rd2),    // output
    .addr2(rf_ra2), // input

    .clk(clk)
  );

  // UART Receiver
  wire [7:0] uart_rx_data_out;
  wire uart_rx_data_out_valid;
  wire uart_rx_data_out_ready;
/*
  uart_rx_alex #(
    .CLOCK_FREQ(CPU_CLOCK_FREQ),
    .BAUD_RATE(BAUD_RATE)
  ) uart_rx (
    .clk(clk),
    .rst(!rst),//posedge reset 
    .m_axis_tdata(uart_rx_data_out),             // output
    .m_axis_tvalid(uart_rx_data_out_valid), // output
    .m_axis_tready(uart_rx_data_out_ready), // input
    .rxd(FPGA_SERIAL_RX)               // input
  );*/

  
  uart_receiver #(
    .CLOCK_FREQ(CPU_CLOCK_FREQ),
    .BAUD_RATE(BAUD_RATE)
  ) uart_rx (
    .clk(clk),
    .rst(!rst),//posedge reset 
    .data_out(uart_rx_data_out),             // output
    .data_out_valid(uart_rx_data_out_valid), // output
    .data_out_ready(uart_rx_data_out_ready), // input
    .serial_in(FPGA_SERIAL_RX)               // input
  );/*
   uart_rx #(
    .CLK_FREQ(CPU_CLOCK_FREQ),
    .BAUD_RATE(BAUD_RATE)
  ) uareceive (
        .clk(clk),
        .rstn(rst),
        .o_tdata(uart_rx_data_out),
        .o_tvalid(uart_rx_data_out_valid),
        .o_tready(uart_rx_data_out_ready),
        .i_uart_rx(FPGA_SERIAL_RX)
    );*/
  // UART Transmitter
  wire [7:0] uart_tx_data_in;
  wire uart_tx_data_in_valid;
  wire uart_tx_data_in_ready;

  uart_transmitter #(
    .CLOCK_FREQ(CPU_CLOCK_FREQ),
    .BAUD_RATE(BAUD_RATE)
  ) uart_tx (
    .clk(clk),
    .rst_n(rst),
    .data_in(uart_tx_data_in),             // input
    .data_in_valid(uart_tx_data_in_valid), // input
    .data_in_ready(uart_tx_data_in_ready), // output
    .serial_out(FPGA_SERIAL_TX)            // output
  );

  // TODO: Your code to implement a fully functioning RISC-V core
  // Add as many modules as you want
  // Feel free to move the memory modules around
  wire [2:0] pcsrc;
  wire [31:0] alu;
  wire [31:0] pc;
  wire [31:0] next_pc;
  wire [31:0] jal_addr;
  wire [31:0] inst;
  wire [31:0] Imm;
  wire br_pred_taken;
  wire is_br_guess,is_br_check,br_taken_check;

  assign imem_addra = next_pc[15:2];
  assign bios_addra = next_pc[12:2];
  //IF Phase
  assign jal_addr = pc + Imm;
  pc_reg #(
    	.RESET_PC(RESET_PC)
    ) pc_reg_u1(
	.clk(clk),
	.rst_n(rst),
	.br_pred_taken(br_pred_taken),
	.pcsrc(pcsrc),
	.alu_addr(alu),
      .inst(inst),
      .jal_addr(jal_addr),
	.restore_addr(pcplusfour),
	.pc(pc),
	.next_pc(next_pc)
	);

  assign is_br_guess = (inst[6:2] == 5'b11000)? 1'b1 : 1'b0;//branch inst judgement
  branch_predictor branch_predictor_u1(//2 bit branch predictor
	.clk(clk),
	.reset(!rst),
	.pc_guess(pc),
	.is_br_guess(is_br_guess),
	.pc_check(EXM_pc),
	.is_br_check(is_br_check),
	.br_taken_check(br_taken_check),
	.br_pred_taken(br_pred_taken)
  );  
  //ID Phase
  wire [31:0] inst_src;//inst and stall mux
  wire stall;
  assign inst_src = pc[30] ? bios_douta : imem_douta;//if pc[30] == 1 then from bios else from iMEM
  assign inst = stall ? 32'h00000013 : inst_src;//if stall then nop else inst_src 
  assign rf_ra1 = inst[19:15];
  assign rf_ra2 = inst[24:20];
  wire [2:0] ImmSel;
  wire BrUn,BSel,ASel;
  wire [3:0] ALUSel,MEMWen;
  wire CSRSrc;
  wire [2:0] LDSel;
  wire [1:0] WBSel;
  wire RegWen;
  control control_u1(//control logic
	.inst(inst),
	.ImmSel(ImmSel),
	.BrUn(BrUn),
	.BSel(BSel),
	.ASel(ASel),
	.ALUSel(ALUSel),
	.MEMWen(MEMWen),
	.CSRSrc(CSRSrc),
	.LDSel(LDSel),
	.WBSel(WBSel),
	.RegWen(RegWen)
  	);

  immgen imm_gen_u1(//imm generator
	 .inst(inst),
	 .immsel(ImmSel),
	 .imm(Imm)
	);

  reg [31:0] ldout;//write back data
  wire [31:0] regq1,regq2,regq1src,regq2src;//2 cycles hazard mux
  assign regq1 = (regq1src)? ldout : rf_rd1;
  assign regq2 = (regq2src)? ldout : rf_rd2;

  wire [31:0] EXM_pc,EXM_rs1,EXM_rs2,EXM_Imm,EXM_inst;
  wire EXM_BrUn,EXM_BSel,EXM_ASel;
  wire [3:0] EXM_ALUSel,EXM_MEMWen;
  wire EXM_CSRSrc;
  wire [2:0] EXM_LDSel;
  wire [1:0] EXM_WBSel;
  wire EXM_RegWen;
  id_exm_regs id_exm_regs_u1(//ID/EXM pipeline register
	.clk(clk),
	.br_pred_taken(br_pred_taken),
	.pc(pc),
	.rs1(regq1),
	.rs2(regq2),
	.imm(Imm),
	.BrUn(BrUn),
	.BSel(BSel),
	.ASel(ASel),
	.ALUSel(ALUSel),
	.MEMWen(MEMWen),
	.CSRSrc(CSRSrc),
	.LDSel(LDSel),
	.WBSel(WBSel),
	.RegWen(RegWen),
	.Inst(inst),

	.br_pred_taken_o(EXM_br_pred_taken),
	.pc_o(EXM_pc),
	.rs1_o(EXM_rs1),
	.rs2_o(EXM_rs2),
	.imm_o(EXM_Imm),
	.BrUn_o(EXM_BrUn),
	.BSel_o(EXM_BSel),
	.ASel_o(EXM_ASel),
	.ALUSel_o(EXM_ALUSel),
	.MEMWen_o(EXM_MEMWen),
	.CSRSrc_o(EXM_CSRSrc),
	.LDSel_o(EXM_LDSel),
	.WBSel_o(EXM_WBSel),
	.RegWen_o(EXM_RegWen),
	.Inst_o(EXM_inst)
	);

  //EXM phase
  wire [31:0] mrs1,mrs2;//alu src mux
  wire [31:0] ALUrs1,ALUrs2;
  wire alurs1src,alurs2src,memdsrc,branchrs1src,branchrs2src;
  assign mrs1 =  (EXM_ASel) ? EXM_pc : EXM_rs1;//mid alu source sel
  assign mrs2 =  (EXM_BSel) ? EXM_Imm : EXM_rs2;
  assign ALUrs1 = (alurs1src) ? ldout : mrs1;//alu source select
  assign ALUrs2 = (alurs2src) ? ldout : mrs2;
  ALU ALU_u1(//ALU
  	.A(ALUrs1),
	.B(ALUrs2),
	.ALUSel(EXM_ALUSel),
	.alu(alu)
  );

  wire [31:0] mmemd,memd;//memd src mux and align
  wire [3:0] MEMWen_align;
  assign mmemd = (memdsrc) ? ldout : EXM_rs2;//store rs2 to mem
  Data_align Data_align_u1(
  	.data_in(mmemd),
  	.MEMWen(MEMWen_align),//after Wen align
  	.data_out(memd)
  );

  wire [31:0] Branchrs1,Branchrs2;//branch src mux
  assign Branchrs1 = (branchrs1src) ? ldout : EXM_rs1;
  assign Branchrs2 = (branchrs2src) ? ldout : EXM_rs2;
  wire BrEq,BrLt;
  Branch_Comp Branch_Comp_u1(//branch comp
	.A(Branchrs1),
	.B(Branchrs2),
	.BrUn(EXM_BrUn),
	.BrEq(BrEq),
	.BrLt(BrLt)
  );
  PCSrc PCSrc_u1(//pcsrc
	.clk(clk),
	.BrEq(BrEq),
	.BrLt(BrLt),
	.br_pred_taken_o(EXM_br_pred_taken),
	.inst(EXM_inst),
	.rst_n(rst),
	.src(pcsrc),
	.stall(stall),
	.is_br_check(is_br_check),
	.br_taken_check(br_taken_check)
  );
  /*
  Stall Stall_u1(//stall
	.pcsrc(pcsrc),
	.stall(stall)
  );*/
  WEN_align WEN_align_u1(//WEN align
	.MEMWen_in(EXM_MEMWen),
	.address(alu),
	.MEMWen_out(MEMWen_align)
  );

  wire WB_RegWen;
  wire [31:0] WB_inst;
  Forwarding Forwarding_u1(//Forwarding
	.IDinst(inst),
	.EXMinst(EXM_inst),
	.WBinst(WB_inst),
	.IDEXMMEMWen(MEMWen_align),
	.EXMWBRegWen(WB_RegWen),
	.IDEXMRegWen(EXM_RegWen),
	.regq1src(regq1src),
	.regq2src(regq2src),
	.alurs1src(alurs1src),
	.alurs2src(alurs2src),
	.memdsrc(memdsrc),
	.branchrs1src(branchrs1src),
	.branchrs2src(branchrs2src)
  );
  wire [3:0] DMEM_WEN;
  DMEM_Wen DMEM_Wen_u1(
  	.Wen_in(MEMWen_align),
	.addr(alu),
	.Wen_out(DMEM_WEN)
  );
  assign dmem_addra = alu[15:2];//DMEM connection
  assign dmem_dina = memd;
  assign dmem_wea = DMEM_WEN;
  wire [3:0] IMEM_WEN;
  IMEM_Wen IMEM_Wen_u1(
	.Wen_in(MEMWen_align),
	.Pc(EXM_pc),
	.addr(alu),
	.Wen_out(IMEM_WEN)
  );
  assign imem_addrb = alu[15:2];//IMEM connection
  assign imem_dinb  = memd;
  assign imem_web   = IMEM_WEN;
  assign bios_addrb = alu[12:2];//BIOS connection

  wire [31:0] uart_control,uart_dout;
  Uart_if Uart_if_u1(//uart interface
	//.clk(clk),
	//.rst_n(rst),
	.din(memd),
	.wbe(MEMWen_align),
	.addr(alu),
	.inst(EXM_inst),
	.data_out(uart_rx_data_out),
	.data_out_valid(uart_rx_data_out_valid),
	.data_in_ready(uart_tx_data_in_ready),
	.dout(uart_dout),
	.control(uart_control),
	.data_out_ready(uart_rx_data_out_ready),
	.data_in(uart_tx_data_in),
	.data_in_valid(uart_tx_data_in_valid)
  );
  wire [31:0] cycle_num;
  Cycle_Counters Cycle_Counters_u1(//cycles counter
	.wbe(MEMWen_align),
	.addr(alu),
	.clk(clk),
	.rst_n(rst),
	.cycles(cycle_num)
  );
  wire [31:0] inst_num;
  Inst_Counters Inst_Counters_u1(//insts counter
	.clk(clk),
	.rst_n(rst),
	.wbe(MEMWen_align),
	.addr(alu),
	.EXMinst(EXM_inst),
	.insts(inst_num)
  );
  wire [31:0] csrd;
  assign csrd = (EXM_CSRSrc) ? ALUrs1 : EXM_Imm;
  CSR CSR_u1(//csr 
	.clk(clk),
	.rst_n(rst),
	.inst(EXM_inst),
	.din(csrd),
	.MEMWen(MEMWen_align),
	.csr(csr)
  );
  wire [31:0] pcplusfour;//EXM / WB pipeline register
  assign pcplusfour = EXM_pc + 32'h4;
  wire [31:0] WB_pc,WB_alu;
  wire [2:0] WB_LDSel;
  wire [1:0] WB_WBSel;
  exm_wb_regs exm_wb_regs_u1(
	.clk(clk),
	.pc(pcplusfour),
	.alu(alu),
	.LDSel(EXM_LDSel),
	.WBSel(EXM_WBSel),
	.RegWen(EXM_RegWen),
	.inst(EXM_inst),

	.pc_o(WB_pc),
	.alu_o(WB_alu),
	.LDSel_o(WB_LDSel),
	.WBSel_o(WB_WBSel),
	.RegWen_o(WB_RegWen),
	.inst_o(WB_inst)
  );

  //WB phase
  reg [31:0] MEM_Out;
  always @(*) begin//MEM output mux
	if(WB_alu[30]) MEM_Out = bios_doutb;
	else if(WB_alu[28]) MEM_Out = dmem_douta;
	else if(WB_alu[31]) begin
			if(WB_alu[7:0] == 8'h00) MEM_Out = uart_control;
			else if(WB_alu[7:0] == 8'h04) MEM_Out = uart_dout;
			else if(WB_alu[7:0] == 8'h10) MEM_Out = cycle_num;
			else if(WB_alu[7:0] == 8'h14) MEM_Out = inst_num;
			else MEM_Out = 32'h0;
		end
	else MEM_Out = 32'h0;
  end
  wire [31:0] midldout;
  LDX LDX_u1(//ld mux(lb,lh,lw,lbu,lhu)
	.LDSel(WB_LDSel),
	.memdout(MEM_Out),
	.address(WB_alu),
	.ldout(midldout)
  );
 
  always @(*) begin // wb sel
	case(WB_WBSel)
	  2'b00: ldout = midldout;
	  2'b01: ldout = WB_alu;
	  2'b10: ldout = WB_pc;
	  default: ldout = 32'h0;
	endcase
  end
  assign rf_wd = ldout;//regfile connection
  assign rf_wa = WB_inst[11:7];
  assign rf_we = WB_RegWen;

endmodule
