module DMEM_Wen(
    input   [3:0]   Wen_in,
    input   [31:0]  addr,
    output  [3:0]   Wen_out
);

    //When addr[28] == 1'b1,can write to DMEM
    assign Wen_out = (addr[28])?Wen_in:4'h0;

endmodule
