module alu(
input logic [3:0] a,
input logic [3:0] b,
input logic [2:0] opcode,


output logic [3:0] ALU_Result





);



always_comb begin

case(opcode)


// ADD 
3'b000: 
ALU_Result = a + b;

// SUB 
3'b001:
ALU_Result = a - b;

// AND 
3'b010 :
ALU_Result = a & b;

// OR 

3'b011 :
ALU_Result = a | b;


// SLT

3'b100 :

if(a < b)

begin

ALU_Result = 1;


end

else 

begin

ALU_Result = 0;

end 

endcase 

end




