module PCSrc(
    input clk,
    input BrEq,
    input BrLt,
    input br_pred_taken_o,
    input [31:0 ]inst,
    input rst_n,//Asynchronous Reset
    output reg [2:0] src,
    output reg stall,
    output reg is_br_check,
    output reg br_taken_check
);
    reg rst_n_align;
    always @(posedge clk) begin
	rst_n_align <= rst_n;
    end

    always @(*) begin
	  stall = 1'b0;
	  is_br_check = 1'b0;
	  br_taken_check = 1'b0;
        if(!rst_n_align) begin 
            src = 3'b000;//reset pc 
	  end
        else if(inst[6:2] == 5'b11001)begin //if jalr inst
            src = 3'b001;// pc = alu
	      stall = 1'b1;
	  end
        else if(inst[6:2] == 5'b11000)begin//if branch inst
		is_br_check = 1'b1;
 		if((inst[14:12] == 3'b000 && BrEq) || (inst[14:12] == 3'b001 && !BrEq) || 
            (inst[14] && !inst[12] && BrLt) || (inst[14] && inst[12] && !BrLt)) begin//if branch taken
			br_taken_check = 1'b1;
			if(br_pred_taken_o)begin//prediction correct
            		src = 3'b010;//pc + 4
			end
			else begin//prediction incorrect
				src = 3'b001;//alu
				stall = 1'b1;
			end					
		end
		else begin//branch not taken
			br_taken_check = 1'b0;	
			if(br_pred_taken_o)begin//prediction incorrect
				src = 3'b100;//restore address,branch + 4
				stall = 1'b1;
			end
			else begin//prediction correct
            		src = 3'b010;//pc + 4
			end	
		end
	   end
        else begin
            src <= 3'b010;//default pc + 4
	  end
    end

endmodule
