// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : exm_web_regs_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-15 16:29:16
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module exm_wb_regs_tb();


reg          clk;
reg   [31:0] pc;
reg          alu;
reg   [2:0]  LDSel;
reg   [1:0]  WBSel;
reg          RegWen;
reg   [31:0] inst;

wire   [31:0] pc_o;
wire          alu_o;
wire   [2:0]  LDSel_o;
wire   [1:0]  WBSel_o;
wire          RegWen_o;
wire   [31:0] inst_o;


always #1 clk = ~clk;
initial begin
  clk = 0;
  pc = 0;
  alu = 0;
  LDSel = 0;
  WBSel = 0;
  RegWen = 0;
  inst = 0;
#4
  pc = 32'h1223_2334;
  alu = 32'h1837;
  LDSel =3'h7;
  WBSel = 2'h2;
  RegWen = 1'b1;
  inst = 32'h9827_a756;

end

exm_web_regs U_EXM_WEB_REGS_0
(  .clk      ( clk      ),
   .pc       ( pc       ),
   .alu      ( alu      ),
   .LDSel    ( LDSel    ),
   .WBSel    ( WBSel    ),
   .RegWen   ( RegWen   ),
   .inst     ( inst     ),
   .pc_o     ( pc_o     ),
   .alu_o    ( alu_o    ),
   .LDSel_o  ( LDSel_o  ),
   .WBSel_o  ( WBSel_o  ),
   .RegWen_o ( RegWen_o ),
   .inst_o   ( inst_o   ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

