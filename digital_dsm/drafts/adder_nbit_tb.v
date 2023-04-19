`timescale 1ns/1ns
module adder_nbit_tb;

 reg [31:0] input1;
 reg [31:0] input2;
 wire [31:0] answer;

 adder_nbit M1 #(32) ( 
  .inp1(input1), 
  .inp2(input2), 
  .sout(answer)
 );

 initial begin
  input1 = 1209;
  input2 = 4565;
  #100;
  $finish;
 end
      
endmodule