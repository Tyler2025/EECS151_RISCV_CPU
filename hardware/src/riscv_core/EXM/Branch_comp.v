module Branch_Comp(
    input [31:0] A,
    input [31:0] B,
    input BrUn,
    output reg BrEq,
    output reg BrLt
);

    //Branch Comparator
    always @(*) begin
        if(BrUn) begin//unsigned comp
            if( A < B ) 
                BrLt = 1'b1;
            else 
                BrLt = 1'b0;
            if( A == B )
                BrEq = 1'b1;
            else
                BrEq = 1'b0;
        end
        else begin//signed comp
             if( $signed(A) < $signed(B) ) 
                BrLt = 1'b1;
            else 
                BrLt = 1'b0;
            if( $signed(A) == $signed(B) )
                BrEq = 1'b1;
            else
                BrEq = 1'b0;

        end
    end

endmodule
