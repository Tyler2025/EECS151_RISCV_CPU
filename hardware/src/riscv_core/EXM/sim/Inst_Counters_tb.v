// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Inst_Counters_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-15 15:12:01
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Inst_Counters_tb();


reg          clk;
reg          rst_n;
reg   [3:0]  wbe;
reg   [31:0] addr;
reg   [31:0] EXMinst;

wire   [31:0] insts;


always #1 clk = ~clk;
initial begin
  clk = 0;
  wbe = 0;
  addr = 0;
  EXMinst = 0;
  rst_n = 1;
  #4 rst_n = 0; #2 rst_n = 1;
  #4 EXMinst = 32'h06410093;
  #4 EXMinst = 32'h410c5f93;
  #16 rst_n = 0; #2 rst_n = 1;
  #4 EXMinst = 32'h00110133;
  #4 EXMinst = 32'hf4209ee3;wbe = 4'hf;
  #4 EXMinst = 32'h00000013;wbe = 4'h1;
  #4 EXMinst = 32'h410c5f23;
  #4 EXMinst = 32'h410c5f93;addr = 32'h8000_0018;wbe = 4'hf;
  #4 EXMinst = 32'h410c5f93;wbe = 4'hf;
  #4 wbe = 4'h0;
end

Inst_Counters U_INST_COUNTERS_0
(  .clk     ( clk     ),
   .rst_n   ( rst_n   ),
   .wbe     ( wbe     ),
   .addr    ( addr    ),
   .EXMinst ( EXMinst ),
   .insts   ( insts   ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

