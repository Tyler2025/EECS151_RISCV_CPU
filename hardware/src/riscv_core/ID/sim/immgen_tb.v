// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : immgen_tb.v
// Author        : Jincheng Zou
// Created On    : 2023-07-08 10:53:49
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module immgen_tb();


reg   [31:0] inst;
reg   [2:0]  immsel;

wire   [31:0] imm;


initial begin
  inst = 0;
  immsel = 3'h0;
  #4 inst = 32'h60010113;//addi sp,sp,1536
  #4 inst = 32'h00e12423;//sw a4,8(sp)
  #4 inst = 32'h00208863;//beq ra,sp,20<main>
  #4 inst = 32'h005412b7;//lui t0,0x541
  #4 inst = 32'h00c000ef;//jal ra,20<main>
  #4 inst = 32'h51e0d073;//csrwi 0x51e,1
  #2  immsel = 3'h1;
  #4 inst = 32'h60010113;//addi sp,sp,1536
  #4 inst = 32'h00e12423;//sw a4,8(sp)
  #4 inst = 32'h00208863;//beq ra,sp,20<main>
  #4 inst = 32'h005412b7;//lui t0,0x541
  #4 inst = 32'h00c000ef;//jal ra,20<main>
  #4 inst = 32'h51e0d073;//csrwi 0x51e,1
  #2 immsel = 3'h2;
 #4 inst = 32'h60010113;//addi sp,sp,1536
  #4 inst = 32'h00e12423;//sw a4,8(sp)
  #4 inst = 32'h00208863;//beq ra,sp,20<main>
  #4 inst = 32'h005412b7;//lui t0,0x541
  #4 inst = 32'h00c000ef;//jal ra,20<main>
  #4 inst = 32'h51e0d073;//csrwi 0x51e,1
 #2 immsel =3'h3;
 #4 inst = 32'h60010113;//addi sp,sp,1536
  #4 inst = 32'h00e12423;//sw a4,8(sp)
  #4 inst = 32'h00208863;//beq ra,sp,20<main>
  #4 inst = 32'h005412b7;//lui t0,0x541
  #4 inst = 32'h00c000ef;//jal ra,20<main>
  #4 inst = 32'h51e0d073;//csrwi 0x51e,1
  #2 immsel =3'h4;  
    #4 inst = 32'h60010113;//addi sp,sp,1536
  #4 inst = 32'h00e12423;//sw a4,8(sp)
  #4 inst = 32'h00208863;//beq ra,sp,20<main>
  #4 inst = 32'h005412b7;//lui t0,0x541
  #4 inst = 32'h00c000ef;//jal ra,20<main>
  #4 inst = 32'h51e0d073;//csrwi 0x51e,1
   #2 immsel =3'h5;
   #4 inst = 32'h60010113;//addi sp,sp,1536
  #4 inst = 32'h00e12423;//sw a4,8(sp)
  #4 inst = 32'h00208863;//beq ra,sp,20<main>
  #4 inst = 32'h005412b7;//lui t0,0x541
  #4 inst = 32'h00c000ef;//jal ra,20<main>
  #4 inst = 32'h51e0d073;//csrwi 0x51e,1
  #2 immsel =3'h7;
  #2 inst = 32'h003100b3;//add ra,sp,gp

end

immgen U_IMMGEN_0
(  .inst   ( inst   ),
   .immsel ( immsel ),
   .imm    ( imm    ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

