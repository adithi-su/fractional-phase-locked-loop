`timescale 1ns/1ns
module digital_dsm(alpha, MSB, clk);
    input [15:0] alpha;
    input clk;
    output MSB;

    integer m = 16; //16 bit
    wire [m:0] vdiff1;
    wire [m+1:0] vint1;
    wire [m+1:0] vreg1;
    wire [m+2:0] vdiff2;
    wire [m+3:0] vint2;
    wire [m+3:0] vreg2;
    wire MSB; 
 
    parameter vth = 1'b0;

    //diff 1: vdiff1 = alpha - MSB
    adder_nbit diff1 #(m) (alpha, {m{MSB}} , vdiff1);  //{N{MSB}} - 2s complement using replication operator 

    //integrator 1: vint1 = vdiff1 + vint1
    adder_nbit i1 #(m) (vdiff1, vreg1, vint1);
    register reg1 #(m) (vint1, clk, vreg1);

    //diff 2: vdiff2 = vreg1 - vd
    adder_nbit diff2 #(m) (vreg2, {m{MSB}} , vdiff2);

    //integrator 2: vint2 = vreg2 + vdiff2
    adder_nbit i2 #(m) (vdiff2, vreg2, vint2);
    register reg2 #(m) (vint2, clk, vreg2);

    //comparator
    index = m+3; 
    MSB = vreg2[index];
    //MSB = vreg2 >> index;
        
endmodule
    

module D_ff(D,clk,Q);
    input D, clk; 
    output Q;
    always @(posedge clk)
    begin 
        Q <= D; 
    end
endmodule 

module adder_nbit #(parameter N=16) (input1,input2,answer);
    input [N-1:0] input1,input2;
    output [N-1:0] answer;
    wire  carry_out;
    wire [N-1:0] carry;
    genvar i;
    generate 
    for(i=0;i<N;i=i+1)
    begin: generate_N_bit_Adder
    if(i==0) 
        half_adder f(input1[0],input2[0],answer[0],carry[0]);
    else
        full_adder f(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
    end
    assign carry_out = carry[N-1];
   endgenerate
endmodule 
 
module half_adder(x,y,s,c);
   input x,y;
   output s,c;
   assign s=x^y;
   assign c=x&y;
endmodule 

module full_adder(x,y,c_in,s,c_out);
    input x,y,c_in;
    output s,c_out;
    assign s = (x^y) ^ c_in;
    assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule 

module register #(parameter N=16) (d, clk, out);
    input clk;
    input [N-1:0] d;
    output [N-1:0] out;
    always @ (posedge clk)
        begin
            out = d;
        end
endmodule

/*module diff #(parameter N=16) (inp1, MSB, dout);
    input [N-1:0] inp1;
    input MSB; 
    output dout; 
    adder_nbit diffn(inp1, {N{MSB}} , dout);  //{N{MSB}} - 2s complement using replication operator 
endmodule
*/