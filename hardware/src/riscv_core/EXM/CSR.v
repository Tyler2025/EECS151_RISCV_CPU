module CSR(
    input clk,
    input rst_n,
    input [31:0]    inst,
    input [31:0]    din,
    input [3:0]     MEMWen,
    output  reg [31:0] csr
);

    //Control State Register,0x51E
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            csr <= 32'h0;
        end
        else if(inst[31:20] == 12'h51E && MEMWen && inst[6:2] == 5'b11100)begin//if csr write to 0x51E
            csr <= din;
        end
    end

endmodule
