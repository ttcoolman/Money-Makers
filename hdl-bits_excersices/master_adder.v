module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire c16;
wire [15:0]sum0;
wire [15:0]sum1;

add16 inst1 (.a(a[15:0]), .b(b[15:0]) , .cin((1'b0)) , .sum(sum[15:0]), .cout(c16));


//if c16 is a zero 
add16 inst2(.a(a[31:16]) , .b(b[31:16]), .cin(1'b0), .sum(sum0), .cout());

//if c16 is a one 

add16 inst3(.a(a[31:16]) , .b(b[31:16]), .cin(1'b1), .sum(sum1), .cout());

//selector 
assign sum[31:16] = c16 ? sum1: sum0;











endmodule
