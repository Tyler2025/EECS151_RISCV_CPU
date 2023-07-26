module Uart_if(
    //input	clk,
    //input	rst_n,
    input   [31:0]  din,
    input   [3:0]   wbe,
    input   [31:0]  addr,
    input   [31:0]  inst,
    input   [7:0]   data_out,
    input   data_out_valid,
    input   data_in_ready,
    output  [31:0]  dout,
    output  [31:0]  control,
    output  data_out_ready,
    output  [7:0]  data_in,
    output  data_in_valid
);
    /*
    reg [7:0] data_out_reg;
    reg data_out_valid_reg;

    //register receive data
    always @(posedge clk or negedge rst_n)begin
        if(data_out_ready || !rst_n) data_out_valid_reg <= 1'b0;
	  else if(data_out_valid) begin
		data_out_valid_reg <= 1'b1;
		data_out_reg	<= data_out;
	  end
    end
    */
    //data lines
    assign  dout = {24'b0,data_out};
    assign  data_in = din[7:0];

    //control
    assign  control = {30'b0,data_out_valid,data_in_ready};

    //other controls
    assign  data_out_ready = (inst[6:2] == 5'b0 && addr == 32'h8000_0004) ? 1'b1 : 1'b0;
    assign  data_in_valid  = (wbe[0] && addr == 32'h8000_0008) ? 1'b1 : 1'b0;

endmodule
