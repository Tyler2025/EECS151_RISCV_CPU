module debouncer #(
    parameter WIDTH              = 1,
    parameter SAMPLE_CNT_MAX     = 62500,
    parameter PULSE_CNT_MAX      = 200,
    parameter WRAPPING_CNT_WIDTH = $clog2(SAMPLE_CNT_MAX),
    parameter SAT_CNT_WIDTH      = $clog2(PULSE_CNT_MAX) + 1
) (
    input clk,
    input [WIDTH-1:0] glitchy_signal,
    output reg [WIDTH-1:0] debounced_signal
);
    // TODO: fill in neccesary logic to implement the wrapping counter and the saturating counters
    // Some initial code has been provided to you, but feel free to change it however you like
    // One wrapping counter is required
    // One saturating counter is needed for each bit of glitchy_signal
    // You need to think of the conditions for reseting, clock enable, etc. those registers
    // Refer to the block diagram in the spec
    reg [WRAPPING_CNT_WIDTH-1:0] wrapping_counter = 0;
    reg [SAT_CNT_WIDTH-1:0] saturating_counter [WIDTH-1:0];
    
    integer k;
    initial begin
        for(k = 0; k < WIDTH; k = k + 1)begin
                saturating_counter[k] = 0;
            end
    end

    wire [WIDTH-1:0] sync_signal;
    reg count_pulse;
    
    wire [WIDTH-1:0] enable;
    wire [WIDTH-1:0] reset;

    //synchronizer
    synchronizer #(WIDTH) s1(.async_signal(glitchy_signal),.clk(clk),.sync_signal(sync_signal));
    
    //sample pulse generator
    always @(posedge clk) begin
        if(wrapping_counter == SAMPLE_CNT_MAX) begin
                wrapping_counter <= 0;
                count_pulse <= 1'b1;
            end
        else begin
                wrapping_counter <= wrapping_counter + 1;
                count_pulse <= 1'b0;
            end

    end

    //debouncer
    assign enable   = ~sync_signal & {6{count_pulse}};
    assign reset    = sync_signal;
    genvar i;
    generate 
        for(i = 0 ; i < WIDTH ; i = i + 1)
            begin:debouncer              
                //assign enable[i] = sync_signal[i] & count_pulse;

                always @(posedge clk) begin
                    if(reset[i]) begin
                        saturating_counter[i] <= 0;
                        debounced_signal[i] <= 1; 
                        end
                    else if(enable[i]) begin
                            if(saturating_counter[i] == PULSE_CNT_MAX) begin
                                    debounced_signal[i] <= 0;
                                end
                            else
                                saturating_counter[i] <= saturating_counter[i] + 1;
                        end
                end 
            end
    endgenerate

endmodule
