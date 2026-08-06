module control_unit(
input logic [6:0]opcode,
input logic [2:0]funct3,
input logic [6:0]funct7,


output logic RegWrite,
output logic ALUSrc,
output logic MemRead,
output logic MemWrite,
output logic Branch,
output logic [2:0] ALUControl,
output logic [2:0] ImmType


);

//Intialize the Control Signals 


RegWrite = 0;
ALU_Src = 0;
MemRead = 0;
MemWrite = 0;
Branch = 0;
//Determines whether we use the immediate or a register value for the second input for the ALU 
ALU_Control = 3'b000;

// ADD 
case(opcode)


// R-Type Instruction 
7'b0110011:
//Using a register as ALU Second Input 
ALU_Src = 0;
RegWrite = 1;

if((funct7 == 7'b0000000) && (funct3 == 3'b000))
begin
//ADD Instruction 
ALU_Control = 3'b000;
end 

//SUB Instruction 
else if((funct3 == 3'b000) && (funct7 == 7'b0100000))
begin

ALU_Control = 3'b001;

end 

//AND Iinstruction 
else if ((funct3 == 3'b111) && (funct7 == 7'b0000000))
begin
ALU_Control = 3'b010;

end
//OR Instruction 

else if ((funct7 == 7'b0000000) && (funct3 == 3'b110))
begin

ALU_Control = 3'b011;

end 
//SLT Instruction 

else if ((funct7 == 7'b0000000) && (funct3 == 3'b010))
begin

ALU_Control = 3'b100;
end 

//Opcode for AddI

7'b0010011: 

ALU_Src = 1;
RegWrite = 1;

ImmType = 3'b000;

//Opcode for LW 
7'b0000011:

MemRead = 1;
RegWrite = 1;
ALU_Src = 1;
ALU_Control = 3'b000;
ImmType = 3'b000;

//Opcode for SW 
7'b0100011:

MemWrite = 1;
ALU_Src = 1;
ImmType = 3'b001;


//Opcode for Branch 

7'b1100011:
Branch = 1;
ImmType = 3'b010;

//Generate the Imm Type Signal for the Immediate Generator 