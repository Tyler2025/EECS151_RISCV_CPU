// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Branch_Comp_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-13 15:42:08
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Branch_Comp_tb();


reg   [31:0] A;
reg   [31:0] B;
reg          BrUn;

wire     BrEq;
wire     BrLt;


initial begin
  A = 0;
  B = 0;
  BrUn = 1;
  #4 A = 1;
    B = 1;
  #4 A = 0;
    B = 1;
  #4 A = -3;
    B = 2;
  #4 A = 2;
    B = -60;
  #4 A = -59;
    B = -59;
  #4
  BrUn = 0;
  #4 A = 1;
    B = 1;
  #4 A = 0;
    B = 1;
  #4 A = -3;
    B = 2;
  #4 A = 2;
    B = -60;
  #4 A = -59;
    B = -59;
end

Branch_Comp U_BRANCH_COMP_0
(  .A    ( A    ),
   .B    ( B    ),
   .BrUn ( BrUn ),
   .BrEq ( BrEq ),
   .BrLt ( BrLt ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

