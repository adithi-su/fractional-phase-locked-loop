//Verilog HDL for "PD", "d_flop" "functional"

module d_flop(
	input D,
	input clk,
	input reset,
	output reg Q
);

	initial Q = 0;

	always @(posedge clk or posedge reset) begin
		if(reset==1'b1)
			Q <= 1'b0;
		else
			Q <= D;
	end
endmodule 
