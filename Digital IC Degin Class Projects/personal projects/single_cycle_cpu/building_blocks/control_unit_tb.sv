`timescale 1ns/1ps


module control_unit_tb;

logic [6:0] opcode;

logic RegWrite;
logic ALUSrc;
logic MemRead;
logic MemWrite;
logic Branch;

logic [2:0] ALUControl;

//Create a instance 
control_unit dut (

.opcode(opcode),

.RegWrite(RegWrite),
.ALUSrc(ALUSrc) ,
.MemRead(MemRead),
.MemWrite(MemWrite),
.Branch(Branch),


.ALUControl(ALUControl)


);



initial begin 

$dumpfile ("control_unit.vcd");
$dumpvars(0,control_unit_tb);


end 
// Initalize the Op_Code


initial 

begin
    
opcode = 7'b0000000;


end


initial begin 


// ADD 

opcode = 7'b0110011;

#10;


// ADDI

opcode = 7'b0010011;


#10;


//LW 

opcode = 7'b0000011;

#10;


//SW 

opcode = 7'b0100011;


 #10;



 // BEQ

opcode = 7'b1100011;

 #10;



    $finish;



end 



initial begin 


$monitor(
"Time = %0t  opcode = %b RegWrite = %b ALUSrc = %b MemRead = %b MemWrite = %b Branch = %b ALUControl = %b ",


$time,
opcode,
RegWrite,
ALUSrc,
MemRead,
MemWrite,
Branch,
ALUControl



);



end 



endmodule