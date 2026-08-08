`timescale 1ns/1ps

module instruction_memory_tb();

input logic [31:0] address ;
output logic [31:0] instruction_memory;




//Instantiate DUT 


instruction_memory dut (

.address(address),
.instruction_memory(instruction_memory)

);


//Generate waveform 
initial 

begin

$dumpfile("instruction_memory_tb.vcd");
$dumpvars(0,instruction_memory);




end 


//Initialize instruction memory 

initial begin 

address = 0;


#10 

address = 4;

#10 

address = 8;

#10 


address = 12;

#10 


$finish;



end 


//Monitor output

initial 

begin

$monitor(
    "Time = %0t Address = %h Instruction = %h ",

    $time,
    address,
    instruction
    
    
    );



end 


endmodule


