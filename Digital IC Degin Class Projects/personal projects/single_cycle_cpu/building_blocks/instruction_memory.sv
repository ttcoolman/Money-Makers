module instruction_memory(


    input logic [31:0] address,
    output logic [31:0] instruction_memory

);


//Create a memory array 

//memory is indexed weird however it is a naming convention 
// Size of the words is 32 bits, and the there is 16 words in the processor

//The number of words in the instruction memory represent the number of instructions the CPU will execute
logic [31:0] memory [0:15];


// Initialize instructions
initial begin 

    memory[0] = 32'h00000013; //NOP
    memory[1] = 32'h00100093; // ADDI x1,x0,1
    memory[2] = 32'h00200113; // ADDI x2,x0,2
    memory[3] = 32'h003081B3; // ADD x3,x1,x3

    memory[4] = 32'h00000013;
    memory[5] = 32'h00000013;

end


//Intruction fetch 

//Fetching the instructions opcode for the instruction decoder 
always_comb begin

instruction = memory[address[5:2]];



end 


endmodule
