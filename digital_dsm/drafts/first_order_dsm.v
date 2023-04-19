module digital_dsm(alpha, MSB, clk);
    input [15:0] alpha;
    input clk;
    output MSB;

    integer m = 16; //16 bit
    wire [15:0] vdiff1;
    wire [16:0] vint1;
    wire [16:0] vreg1;
    wire out_msb;
    reg signed index;

    //diff 1: vdiff1 = alpha - MSB
    adder_nbit #(16) diff1 (alpha, {(16){MSB}}, vdiff1);  //{N{MSB}} - 2s complement using replication operator 

    //integrator 1: vint1 = vdiff1 + vreg1
    assign vdiff1 = {2'b0, vdiff1};
    adder_nbit #(17) i1  (vdiff1, vreg1, vint1);
    register #(16) reg1  (vint1, clk, vreg1);

    //comparator
    assign index = vreg1.size; 
    always @(posedge clk)
        if (vreg1[index-1'b1]==1'b1)
            begin 
                assign MSB = 1'b1;
            end
        else
            begin 
                assign MSB = 1'b0;
            end
    //MSB = vreg2 >> index;
        
endmodule
    

/*module D_ff(D,clk,Q);
    input D, clk; 
    output Q;
    always @(posedge clk)
    begin 
        Q <= D; 
    end
endmodule */

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
    assign answer = {carry_out, answer};
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
            out <= d;
        end
endmodule

/*module diff #(parameter N=16) (inp1, MSB, dout);
    input [N-1:0] inp1;
    input MSB; 
    output dout; 
    adder_nbit diffn(inp1, {N{MSB}} , dout);  //{N{MSB}} - 2s complement using replication operator 
endmodule
*/