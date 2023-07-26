module Inst_Counters(
    input   clk,
    input   rst_n,
    input   [3:0]   wbe,
    input   [31:0]  addr,
    input   [31:0]  EXMinst,
    output  reg [31:0]  insts
);  

    //Inst Counters
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n || (wbe && addr == 32'h8000_0018))//reset or write to reset
            insts <= 32'h0;
        else if(EXMinst != 32'h00000013)
            insts <= insts + 32'h1;
    end

endmodule
