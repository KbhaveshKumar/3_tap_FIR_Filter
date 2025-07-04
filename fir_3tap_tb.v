module fir_3tap_tb;
// Testbench Signals
    reg clk;
    reg rst;
    reg [7:0] xin;               // Input sample
    wire [16:0] y;             // Filter output

    // Instantiate FIR_Filter
    fir_3tap uut (
        .clk(clk),
        .rst(rst),
        .xin(xin),
        .y(y)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test Stimulus
    initial begin
        // Initialize
        rst = 1; 
        xin = 8'd0;
  
        // Reset the system
        #10;
        //rst = 1;
        rst = 0;

        // Apply test cases
         xin = 8'd3;  
        #60 xin = 8'd7;   
        #90 xin = 8'd8;   
        #120 xin = 8'd16;   
  

        // End simulation
        #60 $stop;
    end

endmodule
