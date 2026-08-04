module control_unit(

input logic [6:0] opcode,

output logic RegWrite,
output logic ALUSrc,
output logic MemRead,
output logic MemWrite,
output logic Branch,

output logic [2:0] ALUControl 


);

//The Control Unit acts as a decoder 



always_comb begin 

//Default values 


RegWrite = 0;
ALUSrc = 0;
MemRead = 0 ;
MemWrite = 0 ;
Branch = 0 ;
ALUControl = 3'b000;


case(opcode)

//R-Type ADD 

7'b0110011:
begin

    RegWrite = 1;
    ALUSrc = 0;


    ALUControl = 3'b000;



end


//ADDI 

7'b0010011:
begin

    RegWrite = 1;
    ALUSrc = 1;

    ALUContol = 3'b000;


end

//By Default we do not want to write to the Registers 
default:

begin 

    RegWrite = 0;

end 





endcase








end 


endmodule