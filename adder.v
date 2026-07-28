module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] s1;
    wire c0;
    wire co1;
    add16 ins1 (.a(a[15:0]), .b(b[15:0]) ,.cin(1'b0), .sum(s1), .cout(co1) );


    wire[15:0] s2;

    add16 ins2 (.a(a[31:16]), .b(b[31:16]) ,.cin(co1),.sum(s2),.cout(0) );

assign sum = {s2,s1};
endmodule