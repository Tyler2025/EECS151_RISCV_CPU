// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : id_exm_regs_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-12 14:30:49
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module id_exm_regs_tb();


reg          clk;
reg   [31:0] pc,rs1,rs2,imm;
reg          BrUn,BSel,ASel;
reg   [3:0]  ALUSel,MEMWen;
reg          CSRSrc;
reg   [2:0]  LDSel;
reg   [1:0]  WBSel;
reg          RegWen;
reg   [31:0] Inst;

wire   [31:0] pc_o,rs1_o,rs2_o,imm_o;
wire          BrUn_o,BSel_o,ASel_o;
wire   [3:0]  ALUSel_o,MEMWen_o;
wire          CSRSrc_o;
wire   [2:0]  LDSel_o;
wire   [1:0]  WBSel_o;
wire          RegWen_o;
wire   [31:0] Inst_o;


always #5 clk = ~clk;
initial begin
  clk = 1'b0;
  pc = 32'd0;
  rs1 = 32'd0;
  rs2 = 32'd0;
  imm = 32'd0;
  BrUn = 1'b0;
  BSel = 1'b0;
  ASel = 1'b0;
  ALUSel = 4'h0;
  MEMWen = 4'h0;
  CSRSrc = 1'b0;
  LDSel = 3'h0;
  WBSel = 2'h0;
  RegWen = 1'b0;
  Inst = 32'h0;
  #4 pc = 32'd1234;
  rs1 = 32'd2345;
  rs2 = 32'd3456;
  imm = 32'd4567;
  BrUn = 1'b1;
  BSel = 1'b1;
  ASel = 1'b1;
  ALUSel = 4'h3;
  MEMWen = 4'h15;
  CSRSrc = 1'b1;
  LDSel = 3'h2;
  WBSel = 2'h2;
  RegWen = 1'b1;
  Inst = 32'd1345;

end

id_exm_regs U_ID_EXM_REGS_0
(  .clk      ( clk      ),
   .pc       ( pc       ),
   .rs1      ( rs1      ),
   .rs2      ( rs2      ),
   .imm      ( imm      ),
   .BrUn     ( BrUn     ),
   .BSel     ( BSel     ),
   .ASel     ( ASel),
   .ALUSel   ( ALUSel   ),
   .MEMWen   ( MEMWen   ),
   .CSRSrc   ( CSRSrc   ),
   .LDSel    ( LDSel    ),
   .WBSel    ( WBSel    ),
   .RegWen   ( RegWen   ),
   .Inst     ( Inst     ),
   .pc_o     ( pc_o     ),
   .rs1_o    (rs1_o),
   .rs2_o    (rs2_o),
   .imm_o    (imm_o),
   .BrUn_o   ( BrUn_o   ),
   .BSel_o   ( BSel_o),
   .ASel_o   ( ASel_o),
   .ALUSel_o ( ALUSel_o ),
   .MEMWen_o ( MEMWen_o),
   .CSRSrc_o ( CSRSrc_o ),
   .LDSel_o  ( LDSel_o  ),
   .WBSel_o  ( WBSel_o  ),
   .RegWen_o ( RegWen_o ),
   .Inst_o   ( Inst_o   ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

