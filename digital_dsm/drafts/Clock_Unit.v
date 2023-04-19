`timescale 1ns/1ns
module Clock_Unit (clock);
output clock;
reg clock;
parameter delay = 0;
parameter half_cycle = 250; //500ns /2 
initial begin
#delay clock = 0;
forever #half_cycle clock = ~clock;
end
endmodule