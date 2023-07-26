module uart_transmitter #(
    parameter CLOCK_FREQ = 50_000_000,
    parameter BAUD_RATE = 115_200)
(
    input clk,
    input rst_n,

    input [7:0] data_in,
    input data_in_valid,
    output reg data_in_ready,

    output reg serial_out
);
    reg [9:0] data_shift_buffer;
    // See diagram in the lab guide
    localparam  SYMBOL_EDGE_TIME    =   CLOCK_FREQ / BAUD_RATE;
    localparam  CLOCK_COUNTER_WIDTH =   $clog2(SYMBOL_EDGE_TIME);
    reg [CLOCK_COUNTER_WIDTH-1:0] sym_counter;
    reg [3:0] sent_bits;
    reg symbol_edge;
    reg start;

    //Latch data when valid and ready are both high
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            start <= 0;
        end
        else if(data_in_valid && data_in_ready)begin
            start <= 1;
        end
        else begin
            start <= 0;
        end
    end

    //Counters
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            sym_counter <= 0;
            symbol_edge <= 0;
        end
        else if(start)begin
            sym_counter <= 0;
        end
        else if(sym_counter == SYMBOL_EDGE_TIME - 1 && !data_in_ready)begin
            sym_counter <= 0;
            symbol_edge <= 1;
        end
        else begin
            sym_counter <= sym_counter + 1;
            symbol_edge <= 0;
        end 
    end
    
    //sender
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            serial_out <= 1;
            sent_bits <= 0;
            data_in_ready <= 1;
            data_shift_buffer <= 0;
        end
	  else if(data_in_valid && data_in_ready)begin
            data_in_ready <= 0;
            data_shift_buffer <= {1'b1,data_in,1'b0};
        end
        else if(symbol_edge || start)begin
		if(sent_bits == 10)begin
                serial_out <= 1;
                sent_bits <= 0;
                data_in_ready <= 1;
        	end
            else begin
                serial_out <= data_shift_buffer[0];
                data_shift_buffer <= data_shift_buffer >> 1;
                sent_bits <= sent_bits + 1;
                data_in_ready <= 0;
		end
        end
    end


endmodule
