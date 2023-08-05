
module pc_reg #(
    parameter RESET_PC = 32'h4000_0000
)(
    input clk,
    input rst_n,
    input br_pred_taken,
    input stall,
    input [2:0] pcsrc,
    input [31:0] alu_addr,
    input [31:0] inst,
    input [31:0] jal_addr,
    input [31:0] restore_addr,
    output reg [31:0] pc,
    output reg [31:0] next_pc
);
    
    //PC source MUX
    always @(*) begin
        if((inst[6:2] == 5'b11011 || br_pred_taken) && !stall)
            next_pc = jal_addr;
        else if(pcsrc == 1)
            next_pc = alu_addr;
        else if(pcsrc == 2)
            next_pc = pc + 4;
        else if(pcsrc == 4)
            next_pc = restore_addr;
        else
            next_pc = RESET_PC;
    end

    //PC reg
    always @(posedge clk or negedge rst_n)begin
	  if(!rst_n) 
		pc <= RESET_PC;
	  else
             pc <= next_pc;
    end
endmodule
