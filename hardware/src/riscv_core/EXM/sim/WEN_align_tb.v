// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : WEN_align_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-16 15:46:45
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module WEN_align_tb();


reg   [3:0]  MEMWen_in;
reg   [31:0] address;

wire   [3:0] MEMWen_out;


initial begin
  MEMWen_in = 0;
  address = 0;
  #4  address = 32'h1223_4570;
  #2  MEMWen_in = 4'h1;
  #2  MEMWen_in = 4'h3;
  #2  MEMWen_in = 4'hf;
  #4  address = 32'h1223_4571;
  #2  MEMWen_in = 4'h1;
  #2  MEMWen_in = 4'h3;
  #2  MEMWen_in = 4'hf;
  #4  address = 32'h1223_4572;
  #2  MEMWen_in = 4'h1;
  #2  MEMWen_in = 4'h3;
  #2  MEMWen_in = 4'hf;
  #4  address = 32'h1223_4573;
  #2  MEMWen_in = 4'h1;
  #2  MEMWen_in = 4'h3;
  #2  MEMWen_in = 4'hf;

end

WEN_align U_WEN_ALIGN_0
(  .MEMWen_in  ( MEMWen_in  ),
   .address    ( address    ),
   .MEMWen_out ( MEMWen_out ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

