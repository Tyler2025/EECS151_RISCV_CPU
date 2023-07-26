module LDX(
    input   [2:0] LDSel,
    input   [31:0] memdout,
    input   [31:0]  address,
    output reg [31:0] ldout
);

    //Load select output
    always @(*) begin
        case(LDSel)
            3'b000: begin //8 bits sign
                        case(address[1:0]) //ldout = {{24{memdout[7+8*address[1:0]]}},memdout[7+8*address[1:0] -: 8]};8bit sign whether it synthesize this way would be larger
                            2'b00: ldout = {{24{memdout[7]}},memdout[7:0]};
                            2'b01: ldout = {{24{memdout[15]}},memdout[15:8]};
                            2'b10: ldout = {{24{memdout[23]}},memdout[23:16]};
                            2'b11: ldout = {{24{memdout[31]}},memdout[31:24]};
                        endcase
                    end
            3'b001: begin //ldout = {{16{memdout[15]}},memdout[15:0]};//16bits sign
                        case(address[1:0])
                            2'b00: ldout = {{16{memdout[15]}},memdout[15:0]};
				   2'b01: ldout = {{16{memdout[15]}},memdout[15:0]};
                            2'b10: ldout = {{16{memdout[31]}},memdout[31:16]};
                            2'b11: ldout = {{16{memdout[31]}},memdout[31:16]};
                        endcase
                    end
            3'b010: ldout = memdout;//32 bits
            3'b011: begin //ldout = {24'h0,memdout[7:0]};//8 bits unsign
                        case(address[1:0]) //ldout = {{24{memdout[7+8*address[1:0]]}},memdout[7+8*address[1:0] -: 8]};8bit sign whether it synthesize this way would be larger
                            2'b00: ldout = {24'h0,memdout[7:0]};
                            2'b01: ldout = {24'h0,memdout[15:8]};
                            2'b10: ldout = {24'h0,memdout[23:16]};
                            2'b11: ldout = {24'h0,memdout[31:24]};
                        endcase
                    end
            3'b100: begin//ldout = {16'h0,memdout[15:0]};//16bits unsign
                        case(address[1:0])
                            2'b00: ldout = {16'h0,memdout[15:0]};
                            2'b01: ldout = {16'h0,memdout[15:0]};
                            2'b10: ldout = {16'h0,memdout[31:16]};
                            2'b11: ldout = {16'h0,memdout[31:16]};
                        endcase
                    end
            default: ldout = 32'h0;
        endcase
    end

endmodule
