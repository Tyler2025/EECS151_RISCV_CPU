module IMEM_Wen(
    input   [3:0]   Wen_in,
    input   [31:0]  Pc,
    input   [31:0]  addr,
    output  reg [3:0]   Wen_out
);

    //only when PC[30] == 1'b1, && address[29] == 1,can write to IMEM
    always @(*) begin
        if(Pc[30] == 1'b1 && addr[29] == 1'b1)
            Wen_out = Wen_in;
        else
            Wen_out = 4'h0;
    end


endmodule
