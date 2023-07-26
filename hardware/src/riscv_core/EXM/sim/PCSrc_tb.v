// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : PCSrc_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-13 17:09:00
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module PCSrc_tb();


reg     BrEq;
reg     BrLt;
reg     [31:0] inst;
reg     rst;

wire   [1:0] src;


initial begin
  BrEq = 0;
  BrLt = 0;
  inst = 0;
  rst = 0;
  #4 rst = 1; #2 rst = 0;
  #4 inst = 32'h000003ef;//jal
  #4 inst = 32'h4d508467;//jalr
  #4 inst = 32'h08248663;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//beq
  #4 inst = 32'h08351463;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//bne
  #4 inst = 32'h0845c263;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//blt
  #4 inst = 32'h08565063;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//bge
  #4 inst = 32'h0666ee63;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//bltu
  #4 inst = 32'h06777c63;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//bgeu
  #4 inst = 32'h00840783;BrEq = 1;#2 BrEq = 0;#2 BrLt = 1;#2 BrLt = 0;//lb
end

PCSrc U_PCSRC_0
(  .BrEq ( BrEq ),
   .BrLt ( BrLt ),
   .inst ( inst ),
   .rst  ( rst  ),
   .src  ( src  ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

