// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Forwarding_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-14 21:36:27
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Forwarding_tb();


reg   [31:0] IDinst;
reg   [31:0] EXMinst;
reg   [31:0] WBinst;
reg   [3:0]  IDEXMMEMWen;
reg          EXMWBRegWen;
reg          IDEXMRegWen;

wire     regq1src;
wire     regq2src;
wire     alurs1src;
wire     alurs2src;
wire     memdsrc;
wire     branchrs1src;
wire     branchrs2src;


initial begin
  IDinst = 32'h00000013;//ALU - ALU
  EXMinst = 32'h00517633;
  WBinst = 32'h40308133;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b1;
  #4
  IDinst = 32'h00000013;
  EXMinst = 32'h0022f633;
  WBinst = 32'h40308133;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b1;
  #4
  IDinst = 32'h00000013;//MEM - ALU
  EXMinst = 32'h00517633;
  WBinst = 32'h0050a103;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b1;
  #4
  IDinst = 32'h00000013;
  EXMinst = 32'h0022f633;
  WBinst = 32'h0050a103;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b1;
  #4
  IDinst = 32'h00000013;//ALU - MEM
  EXMinst = 32'h0011a023;
  WBinst = 32'h06410093;
  IDEXMMEMWen = 4'hF;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h00000013;
  EXMinst = 32'h0030a023;
  WBinst = 32'h06410093;
  IDEXMMEMWen = 4'hF;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h00000013;//MEM - MEM
  EXMinst = 32'h00112223;
  WBinst = 32'h00012083;
  IDEXMMEMWen = 4'hF;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h00000013;
  EXMinst = 32'h0030a023;
  WBinst = 32'h00012083;
  IDEXMMEMWen = 4'hF;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h00000013;//Branch
  EXMinst = 32'hf8208ee3;
  WBinst = 32'h06408093;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h00000013;
  EXMinst = 32'hf81118e3;
  WBinst = 32'h06408093;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h06408093;//2 cycles hazards
  EXMinst = 32'h00000013;
  WBinst = 32'h06410093;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'h00110133;
  EXMinst = 32'h00000013;
  WBinst = 32'h06410093;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'hf62084e3;//2 cycles branch  hazards
  EXMinst = 32'h00000013;
  WBinst = 32'h06408093;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;
  #4
  IDinst = 32'hf4209ee3;
  EXMinst = 32'h00000013;
  WBinst = 32'h06410113;
  IDEXMMEMWen = 4'h0;
  EXMWBRegWen = 1'b1;
  IDEXMRegWen = 1'b0;








end

Forwarding U_FORWARDING_0
(  .IDinst       ( IDinst       ),
   .EXMinst      ( EXMinst      ),
   .WBinst       ( WBinst       ),
   .IDEXMMEMWen  ( IDEXMMEMWen  ),
   .EXMWBRegWen  ( EXMWBRegWen  ),
   .IDEXMRegWen  ( IDEXMRegWen  ),
   .regq1src     ( regq1src     ),
   .regq2src     ( regq2src     ),
   .alurs1src    ( alurs1src    ),
   .alurs2src    ( alurs2src    ),
   .memdsrc      ( memdsrc     ),
   .branchrs1src ( branchrs1src ),
   .branchrs2src ( branchrs2src ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

