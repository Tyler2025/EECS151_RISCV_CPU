module id_exm_regs(
    input clk,
    input [31:0] pc,rs1,rs2,imm,
    input BrUn,BSel,ASel,
    input [3:0] ALUSel,MEMWen,
    input CSRSrc,
    input [2:0] LDSel,
    input [1:0] WBSel,
    input RegWen,
    input [31:0] Inst,
    output reg [31:0] pc_o,rs1_o,rs2_o,imm_o,
    output reg BrUn_o,BSel_o,ASel_o,
    output reg [3:0] ALUSel_o,MEMWen_o,
    output reg CSRSrc_o,
    output reg [2:0] LDSel_o,
    output reg [1:0] WBSel_o,
    output reg RegWen_o,
    output reg [31:0] Inst_o
);

    //Regs
    always @(posedge clk)begin
        pc_o    <= pc;
        rs1_o   <= rs1;
        rs2_o   <= rs2;
        imm_o   <= imm;
        BrUn_o  <= BrUn;
        BSel_o  <= BSel;
        ASel_o  <= ASel;
        ALUSel_o<= ALUSel;
        MEMWen_o<= MEMWen;
        CSRSrc_o<= CSRSrc;
        LDSel_o <= LDSel;
        WBSel_o <= WBSel;
        RegWen_o<= RegWen;
        Inst_o  <= Inst;
    end

endmodule
