




//General variables 
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

endmodule

module add1 ( input a, input b, input cin, output sum, output cout );


// Full adder module here
add16 ins2 (.a(a[31:16]), .b(b[31:16]) , .cin(0), .sum(sum[31:16]) , .cout(0));




    
wire c0[31:0];

    add1 ins1 (.a(a[0]), .b[0], .cin(0), .sum(sum[0]), .cout(c0[0]) );
    add1 ins1 (.a(a[0]), .b[0], .cin(0), .sum(sum[0]), .cout(c0[0]) );
    add1 ins1 (.a(a[0]), .b[0], .cin(0), .sum(sum[0]), .cout(c0[0]) );
    






endmodule
