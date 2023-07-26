module synchronizer #(parameter WIDTH = 1) (
    input [WIDTH-1:0] async_signal,
    input clk,
    output reg [WIDTH-1:0] sync_signal
);
    // TODO: Create your 2 flip-flop synchronizer here
    // This module takes in a vector of WIDTH-bit asynchronous
    // (from different clock domain or not clocked, such as button press) signals
    // and should output a vector of WIDTH-bit synchronous signals
    // that are synchronized to the input clk
    reg [WIDTH-1:0] mid_signal;
    always @(posedge clk)begin
        mid_signal <= async_signal;
        sync_signal <= mid_signal;
    end
    // Remove this line once you create your synchronizer
    //assign sync_signal = 0;
endmodule
