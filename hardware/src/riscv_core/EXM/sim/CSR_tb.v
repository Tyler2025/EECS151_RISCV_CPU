// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : CSR_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-15 15:39:42
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module CSR_tb();


reg          clk;
reg          rst_n;
reg   [31:0] inst;
reg   [31:0] din;
reg   [3:0]  MEMWen;

wire   [31:0] csr;


always #1 clk = ~clk;
initial begin
  clk = 0;
  inst = 0;
  din = 0;
  MEMWen = 0;
  rst_n = 1;
  #4 rst_n = 0; #2 rst_n = 1;
  #2 din = 32'h1;inst = 32'h51e51073;MEMWen = 4'hf;
  #4 din = 32'h5;
  #4 din = 32'h8;inst = 32'h51e0d073;
  #4 din = 32'ha;MEMWen = 4'h0;
  #4 MEMWen = 4'hF;
  #4 MEMWen = 4'h0;
  #4 din = 32'hb;
end

CSR U_CSR_0
(  .clk    ( clk    ),
   .rst_n  ( rst_n  ),
   .inst   ( inst   ),
   .din    ( din    ),
   .MEMWen ( MEMWen ),
   .csr    ( csr    ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

