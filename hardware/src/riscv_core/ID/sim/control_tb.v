// -----------------------------------------------------------------
//                 Copyright (c) 2023 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : control_tb.v
// Author        : Yicheng Lu
// Created On    : 2023-07-11 20:59:48
// Last Modified :
// -----------------------------------------------------------------
// Description:
//
// -----------------------------------------------------------------

`timescale 1ns/1ps

module control_tb();


reg   [31:0] inst;

wire   [2:0]  ImmSel;
wire          BrUn;
wire   [3:0]  ALUSel;
wire   [3:0]  MEMWen;
wire          CSRSrc;
wire   [2:0]  LDSel;
wire   [1:0]  WBSel;
wire          RegWen;
wire   [31:0] Inst;


initial begin
    inst = 32'h004d22b7;//lui 
    #4
    inst = 32'h004d3317;//auipc 
    #4
    inst = 32'h000003ef;//jal 
    #4
    inst = 32'h4d508467;//jalr 
    #4
    inst = 32'h08248663;//beq
    #4
    inst = 32'h08351463;//bne 
    #4
    inst = 32'h0845c263;//blt 
    #4
    inst = 32'h08565063;//bge
    #4
    inst = 32'h0666ee63;//bltu 
    #4
    inst = 32'h06777c63;//bgtu
    #4
    inst = 32'h00840783;//lb 
    #4
    inst = 32'h00849803;//lh
    #4
    inst = 32'h00852883;//lw 
    #4
    inst = 32'h0085c903;//lbu
    #4
    inst = 32'h00865983;//lhu 
    #4
    inst = 32'h01468423;//sb 
    #4
    inst = 32'h01571423;//sh
    #4
    inst = 32'h0167a423;//sw 
    #4
    inst = 32'hfce80b93;//addi
    #4
    inst = 32'hfcd8ac13;//slti 
    #4
    inst = 32'h4d693c93;//sltiu 
    #4
    inst = 32'h4d79cd13;//xori 
    #4
    inst = 32'h4d8a6d93;//ori 
    #4
    inst = 32'h4d9afe13;//andi
    #4
    inst = 32'h00eb1e93;//slli
    #4
    inst = 32'h00fbdf13;//srli
    #4
    inst = 32'h410c5f93;//srai
    #4
    inst = 32'h001c8033;//add 
    #4
    inst = 32'h402d00b3;//sub 
    #4
    inst = 32'h003d9133;//sll 
    #4
    inst = 32'h004e21b3;//slt 
    #4
    inst = 32'h005eb233;//sltu 
    #4
    inst = 32'h006f42b3;//xor
    #4
    inst = 32'h007fd333;//srl
    #4
    inst = 32'h408053b3;//sra 
    #4
    inst = 32'h0090e433;//or 
    #4
    inst = 32'h00a174b3;//and
    #4
    inst = 32'h51e51073;//csrw 
    #4
    inst = 32'h51e0d073;//csrwi
end

control U_CONTROL_0
(  .inst   ( inst   ),
   .ImmSel ( ImmSel ),
   .BrUn   ( BrUn   ),
   .ALUSel ( ALUSel ),
   .MEMWen ( MEMWen ),
   .CSRSrc ( CSRSrc ),
   .LDSel  ( LDSel  ),
   .WBSel  ( WBSel  ),
   .RegWen ( RegWen ),
   .Inst   ( Inst   ));


initial begin
  $fsdbDumpvars();
  $fsdbDumpMDA();
  $dumpvars();
  #1000 $finish;
end

endmodule

