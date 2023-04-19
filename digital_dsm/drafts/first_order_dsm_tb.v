module digital_dsm_test;

    reg [15:0] alpha;
    reg clk;
    wire MSB;

    
    digital_dsm #(16) dut (alpha, MSB, clk);

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial
	 begin
         $dumpfile("digital_dsm_test.vcd");
         $dumpvars(0,digital_dsm_test);
		alpha = 16'b1100110011001101;
		#50 $finish;
	 end

     always @(posedge clk) begin
    $display("Output data: %b", data_out);
    end

endmodule
