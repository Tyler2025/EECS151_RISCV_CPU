// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Stall_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-13 19:12:14
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Stall_tb();


reg   [31:0] inst;
reg   [1:0]  pcsrc;

wire     stall;


initial begin
  inst = 0;
  pcsrc = 0;
  #4  pcsrc= 2'b1; 
  #4  pcsrc= 2'b10;
    #4 pcsrc = 2'b11;
end

Stall U_STALL_0
(  .inst  ( inst  ),
   .pcsrc ( pcsrc ),
   .stall ( stall ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

