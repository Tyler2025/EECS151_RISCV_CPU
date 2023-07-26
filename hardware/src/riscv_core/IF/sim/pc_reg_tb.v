// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : pc_reg_tb.v
// Author        : Jincheng Zou
// Created On    : 2023-07-05 16:11:42
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module pc_reg_tb();

parameter RESET_PC = 32'h4000_0000;

reg          clk;
reg   [1:0]  pcsrc;
reg   [31:0] alu_addr;

wire   [31:0] pc;
wire   [31:0] next_pc;


always #1 clk = ~clk;
initial begin
  clk = 0;
  pcsrc = 0;
  alu_addr = 0;
  #50 pcsrc = 1;
  alu_addr = 45;
  #50 pcsrc = 2;
end

pc_reg #(  .RESET_PC ( RESET_PC ))
U_PC_REG_0
(  .clk      ( clk      ),
   .pcsrc    ( pcsrc    ),
   .alu_addr ( alu_addr ),
   .pc       ( pc       ),
   .next_pc  ( next_pc  ));

`ifdef FSDB
initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end
`endif

endmodule

