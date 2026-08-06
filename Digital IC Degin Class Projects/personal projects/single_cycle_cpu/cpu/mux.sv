module mux (

    input logic [31:0] A,
    input logic [31:0] B,

    input logic select,

    output logic [31:0] Y
);


assign Y = select ? B : A ;



endmodule