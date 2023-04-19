`timescale 1us/1us
module digital_dsm_test;

    reg [15:0] alpha;
    wire clk;
    wire MSB;

    Clock_Unit CLK (clk);
    digital_dsm DSM #(16) (alpha, MSB, clk);

    initial
	 begin
		alpha = 16'b1100110011001101;
		#10 $finish;
	 end

endmodule
