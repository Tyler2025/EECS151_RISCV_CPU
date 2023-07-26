module PCSrc(
    input clk,
    input BrEq,
    input BrLt,
    input [31:0 ]inst,
    input rst_n,//Asynchronous Reset
    output reg [1:0] src
);
    reg rst_n_align;
    always @(posedge clk) begin
	rst_n_align <= rst_n;
    end

    always @(*) begin
        if(!rst_n_align) 
            src <= 2'b00;//reset pc 
        else if(inst[6:2] == 5'b11011 || inst[6:2] == 5'b11001)//if jump inst.
            src <= 2'b01;// pc = alu
        else if(inst[6:2] == 5'b11000 && ((inst[14:12] == 3'b000 && BrEq) || (inst[14:12] == 3'b001 && !BrEq) || 
            (inst[14] && !inst[12] && BrLt) || (inst[14] && inst[12] && !BrLt) ))//branch
            src <= 2'b01;// pc =alu
        else
            src <= 2'b10;//default pc + 4
    end

endmodule
