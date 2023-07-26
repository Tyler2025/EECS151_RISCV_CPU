// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Cycle_Counters_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-15 15:05:57
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Cycle_Counters_tb();


reg   [3:0]  wbe;
reg   [31:0] addr;
reg          clk;
reg          rst_n;

wire   [31:0] cycles;


always #1 clk = ~clk;
initial begin
  wbe = 0;
  addr = 0;
  clk = 0;
  rst_n = 1;
  #4 rst_n = 0; #2 rst_n = 1;
  #50 rst_n = 0; #2 rst_n = 1;
  #20 wbe = 4'hf; addr = 32'h8000_0018;
  #4 wbe = 4'h0;
end

Cycle_Counters U_CYCLE_COUNTERS_0
(  .wbe    ( wbe    ),
   .addr   ( addr   ),
   .clk    ( clk    ),
   .rst_n  ( rst_n  ),
   .cycles ( cycles ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

