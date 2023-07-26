module Data_align(
    input   [31:0]  data_in,
    input   [3:0]   MEMWen,
    output  reg [31:0]  data_out
);

    //align data according to adress and sb/sh/sw
    always @(*)begin
        case(MEMWen)
            4'b0001:    data_out = {24'h0,data_in[7:0]};
            4'b0010:    data_out = {16'h0,data_in[7:0],8'h0};
            4'b0100:    data_out = {8'h0,data_in[7:0],16'h0};
            4'b1000:    data_out = {data_in[7:0],24'h0};
            4'b0011:    data_out = {16'h0,data_in[15:0]};
            4'b1100:    data_out = {data_in[15:0],16'h0};
            4'b1111:    data_out = data_in;
            default:    data_out = data_in;
        endcase
    end

endmodule
