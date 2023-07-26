module ALU(
    input   [31:0] A,B,//a = rs1,b = rs2
    input   [3:0]  ALUSel,
    output  reg [31:0] alu
);

    //alu
    always @(*) begin
        case(ALUSel)
            4'h0:   alu = A + B;//add
            4'h1:   alu = A - B;//sub
            4'h2:   alu = A << B[4:0];//sll
            4'h3:   alu = ($signed(A) < $signed(B)) ? 32'h1 : 32'h0;//slt,use signed function
            4'h4:   alu = (A < B) ? 32'h1 : 32'h0;//sltu
            4'h5:   alu = A ^ B;//xor
            4'h6:   alu = A >> B[4:0];//srl
            4'h7:   alu = $signed(A) >>> B[4:0];//sra
            4'h8:   alu = A | B;//or
            4'h9:   alu = A & B;//and
            4'ha:   alu = A;//A
            4'hb:   alu = B;//B
            default:alu = 32'h0;
        endcase
    end

endmodule

