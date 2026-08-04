module alu (


    input logic [3:0] a,
    input logic [3:0] b,
    input logic [1:0] op,
    output logic [3:0] result

);


always_comb begin
case(op)



2'b00:

    result = a + b; // ADD 


2'b01:

    result = a - b; // SUB 


2'b10:

    result = a & b; // AND 


2'b11:

    result = a | b ; //OR 

    endcase 

end 


endmodule










