module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

wire [31:0] bsub;
wire co;

assign bsub = b ^ {32{sub}};

    
    add16 inst1(.a(a[15:0]) , .b(bsub[15:0]), .cin(sub), .sum(sum[15:0]) , .cout(co)   );
    add16 inst2(.a(a[31:16]) , .b(bsub[31:16]), .cin(co), .sum(sum[31:16]), .cout() );




    
    
    
    
    

endmodule
