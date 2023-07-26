// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : ALU_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-13 10:37:51
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module ALU_tb();


reg   [31:0] A,B;
reg   [3:0]  ALUSel;

wire   [31:0] alu;


initial begin
  A = 32'h1234;
  B = -32'h3;
  ALUSel = 0;
  #4    ALUSel = 0;
  #4    ALUSel = 1;
  #4    ALUSel = 2;
  #4    ALUSel = 3;
	A = -32'h4;
#4  ALUSel = 4;
#4  ALUSel = 5;
#4  ALUSel= 6;
	A = 32'h1234_4567;
#4  ALUSel = 7;
#4  ALUSel = 8;
#4  ALUSel = 9;
#4  ALUSel = 'ha;
#4  ALUSel = 'hb;
#4  ALUSel = 'hc;

end

ALU U_ALU_0
(  .A      ( A      ),
   .B      (B),
   .ALUSel ( ALUSel ),
   .alu    ( alu    ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

