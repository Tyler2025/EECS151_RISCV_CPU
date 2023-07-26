module exm_wb_regs(
    input           clk,
    input   [31:0]  pc,
    input   [31:0]  alu,
    input   [2:0]   LDSel,
    input   [1:0]   WBSel,
    input           RegWen,
    input   [31:0]  inst,
    output  reg [31:0]  pc_o,
    output  reg [31:0]  alu_o,
    output  reg [2:0]   LDSel_o,
    output  reg [1:0]   WBSel_o,
    output  reg         RegWen_o,
    output  reg [31:0]  inst_o
);

    //pipeline registers
    always @(posedge clk) begin
        pc_o    <=  pc;
        alu_o   <=  alu;
        LDSel_o <=  LDSel;
        WBSel_o <=  WBSel;
        RegWen_o<=  RegWen;
        inst_o  <=  inst;
    end


endmodule
