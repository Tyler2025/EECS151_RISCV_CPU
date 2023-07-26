module immgen(
    input [31:0] inst,
    input [2:0] immsel,
    output reg [31:0] imm
);
    //six different imm generation type
    //encoding:000 I-type,001 S-type,010 B-type,011 U-type,100 J-type,101 CSR
    always @(*)begin
        case(immsel)
            3'b000: imm = {{20{inst[31]}},inst[31:20]};//I-type,sign extended to 32 bits
            3'b001: imm = {{20{inst[31]}},inst[31:25],inst[11:7]};//S-type,sign extended,
            3'b010: imm = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};//B-type,
            3'b011: imm = {inst[31:12],12'd0};//U-type
            3'b100: imm = {{12{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};//J-type
            3'b101: imm = {27'd0,inst[19:15]};//CSR
            default:imm = 0;
        endcase
    end

endmodule


