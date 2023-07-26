module  Cycle_Counters(
    input   [3:0]  wbe,
    input   [31:0]  addr,
    input   clk,
    input   rst_n,
    output  reg    [31:0]  cycles
);

    //cycles counter
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n || (wbe && addr == 32'h8000_0018))begin
            cycles <= 32'h0;
        end
        else begin
            cycles <= cycles + 32'h1;
        end
    end


endmodule
