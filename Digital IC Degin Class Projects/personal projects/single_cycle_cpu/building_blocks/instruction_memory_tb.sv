`timescale 1ns/1ps

module instruction_memory_tb;

logic [31:0] address;
logic [31:0] instruction;



//Instantiate DUT 

instruction_memory dut (

    .address(address),

    .instruction(instruction)



);



//Generate waveform 


initial begin 

$dumpfile("instruction_memory.vcd");
$dumpvars(0, instruction_memory_tb);





end




//Test addresses 

initial begin 


address = 0;

#10;

address = 4;

#10;

address = 8;

#10;

address = 12;

#10;

$finish;



end

//Monitor output 


initial begin 


$monitor(

    "Time=%0t Address=%h Instruction = %h" ,
    $time,
    address,
    instruction

);


end 


endmodule 

