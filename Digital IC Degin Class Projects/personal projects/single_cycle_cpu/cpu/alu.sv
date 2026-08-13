module alu(
input logic [31:0] a,
input logic [31:0] b,
input logic [31:0] ALUControl,

output logic Zero, 

output logic [31:0] ALU_Result





);



always_comb begin

case(ALU_Control)


// ADD 
3'b000: 
ALU_Result = a + b;

// SUB 
3'b001:
begin
ALU_Result = a - b;


if( ALU_Result == 0)

    begin
    Zero = 1; 

    end 


end
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

endmodule




