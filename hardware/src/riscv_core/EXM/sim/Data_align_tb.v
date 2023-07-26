// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Data_align_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-16 16:31:54
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Data_align_tb();


reg   [31:0] data_in;
reg   [3:0]  MEMWen;

wire   [31:0] data_out;


initial begin
  data_in = 32'h1234_5678;
  MEMWen = 4'h0;
  for(integer i=0;i<15;i=i+1)
    #4 MEMWen = MEMWen + 1;

end

Data_align U_DATA_ALIGN_0
(  .data_in  ( data_in  ),
   .MEMWen   ( MEMWen   ),
   .data_out ( data_out ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

