// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : LDX_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-15 16:03:26
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module LDX_tb();


reg   [2:0]  LDSel;
reg   [31:0] memdout;
reg   [31:0] address;
wire   [31:0] ldout;


initial begin
  LDSel = 3'h0;
  memdout = -32'd12345;
  address = 32'h12345670;
  #4  LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 address = 32'h12345671;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 address = 32'h12345672;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 address = 32'h12345673;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 memdout = 32'd7812345;
#4 address = 32'h12345670;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 address = 32'h12345671;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 address = 32'h12345672;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
#4 address = 32'h12345673;
#4 LDSel = 3'h0;
#4 LDSel = 3'h1;
#4 LDSel = 3'h2;
#4 LDSel = 3'h3;
#4 LDSel = 3'h4;
#4 LDSel = 3'h5;
end

LDX U_LDX_0
(  .LDSel   ( LDSel   ),
   .memdout ( memdout ),
   .address ( address ),
   .ldout   ( ldout   ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

