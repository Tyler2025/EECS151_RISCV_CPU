module Stall(
    //input [31:0] inst,
    input [1:0]  pcsrc,
    output reg stall
);
    
    always @(*) begin//if branch or jump than stall 1 cycle.
        if(pcsrc == 2'b01)begin
                stall = 1'b1;
            end
        else begin
            stall = 1'b0;
        end
    end

endmodule
