module WEN_align(
    input   [3:0] MEMWen_in,
    input   [31:0]  address,
    output  reg [3:0]   MEMWen_out
);

    //align Wen signal according to address
    always @(*) begin
        case(MEMWen_in)
            4'h1:case(address[1:0])//sb 
                    2'b00:  MEMWen_out = 4'b0001;
                    2'b01:  MEMWen_out = 4'b0010;
                    2'b10:  MEMWen_out = 4'b0100;
                    2'b11:  MEMWen_out = 4'b1000;
                endcase
            4'h3:case(address[1:0])//sh
                    2'b00:  MEMWen_out = 4'b0011;//unaligned access 01 same as 00,11 as 10
                    2'b01:  MEMWen_out = 4'b0011;
                    2'b10:  MEMWen_out = 4'b1100;
                    2'b11:  MEMWen_out = 4'b1100;
                endcase
            4'hf:   MEMWen_out = 4'b1111;
            default: MEMWen_out = 4'b0000;
        endcase
    end

endmodule
