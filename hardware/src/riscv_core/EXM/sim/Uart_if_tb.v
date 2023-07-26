// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : Uart_if_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-15 14:14:10
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module Uart_if_tb();


reg   [31:0] din;
reg   [3:0]  wbe;
reg   [31:0] addr;
reg   [31:0] inst;
reg   [7:0]  data_out;
reg          data_out_valid;
reg          data_in_ready;

wire   [31:0] dout;
wire   [31:0] control;
wire          data_out_ready;
wire   [31:0] data_in;
wire          data_in_valid;


initial begin
 //write 
  din = 32'h0000_0045;
  wbe = 4'b0001;
  addr = 32'h8000_0008;
  inst = 32'h0011a023;//sw
  data_out = 8'b0;
  data_out_valid = 1'b0;
  data_in_ready = 1'b1;
  //read
  #4 ;
  din = 32'h0000_0005;
  wbe = 4'b0000;
  addr = 32'h8000_0004;
  inst = 32'h00012083;//lw
  data_out = 8'h67;
  data_out_valid = 1'b1;
  data_in_ready = 1'b1;
  //read control
  #4 ;
  din = 32'h0000_0005;
  wbe = 4'b0000;
  addr = 32'h8000_0000;
  inst = 32'h00012083;//lw
  data_out = 8'h67;
  data_out_valid = 1'b1;
  data_in_ready = 1'b0;

end

Uart_if U_UART_IF_0
(  .din            ( din            ),
   .wbe            ( wbe            ),
   .addr           ( addr           ),
   .inst           ( inst           ),
   .data_out       ( data_out       ),
   .data_out_valid ( data_out_valid ),
   .data_in_ready  ( data_in_ready  ),
   .dout           ( dout           ),
   .control        ( control        ),
   .data_out_ready ( data_out_ready ),
   .data_in        ( data_in        ),
   .data_in_valid  ( data_in_valid  ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

