module fifo #(
    parameter WIDTH = 8,
    parameter DEPTH = 32,
    parameter POINTER_WIDTH = $clog2(DEPTH)
) (
    input clk, rst,

    // Write side
    input wr_en,
    input [WIDTH-1:0] din,
    output full,

    // Read side
    input rd_en,
    output reg [WIDTH-1:0] dout,
    output empty
);
    //reg&pointer define
    reg [WIDTH-1 : 0] fifo_buffer[DEPTH-1 : 0];
    reg [POINTER_WIDTH : 0] wr_ptr;
    reg [POINTER_WIDTH : 0] rd_ptr;

    //ptr wires
    wire [POINTER_WIDTH-1 : 0] wr_ptr_true;
    wire [POINTER_WIDTH-1 : 0] rd_ptr_true;
    wire                        wr_ptr_msb,rd_ptr_msb;

    assign {wr_ptr_msb,wr_ptr_true} = wr_ptr;
    assign {rd_ptr_msb,rd_ptr_true} = rd_ptr;

    //read 
    always @(posedge clk or negedge rst) begin
        if(!rst)begin
            rd_ptr <= 'd0;
        end
        else if(rd_en && !empty)begin
                dout <= fifo_buffer[rd_ptr_true];
                rd_ptr <= rd_ptr + 1'b1;
        end
    end

    //write
    always @(posedge clk or negedge rst) begin
        if(!rst)begin
            wr_ptr <= 'd0;
        end
        else if (wr_en && !full)begin
            fifo_buffer[wr_ptr_true] <= din;
            wr_ptr <= wr_ptr + 1'b1;
        end
    end

    // empty & full signal generation
    assign empty = (wr_ptr == rd_ptr)? 1'b1 : 1'b0;
    assign full = ((wr_ptr_msb != rd_ptr_msb) && (wr_ptr_true == rd_ptr_true))? 1'b1 : 1'b0;


endmodule
