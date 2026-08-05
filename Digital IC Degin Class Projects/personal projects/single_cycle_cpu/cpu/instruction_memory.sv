module instruction_memory(

input logic [31:0]address,

//Creates a word buffer 
output logic  [31:0]instruction_memory




);


// Create a memory array 


//Creates a stack of words 
logic output [31:0]memory  [0:15];



initial begin
memory[0] = 32'h00000013;
memory[1] = 32'h00100093;
memory[2] = 32'h00200113;
memory[3] = 32'h003081B3;
memory[4] = 32'h00000013;
memory[5] = 32'h00000013;





end 


//Instruction fetch 

//Fetching the instruction from the pc and putting into the sram 
always_comb begin 

//Cache has 16 words because of the 4 bits and also starts at the third bit because of byte indexing 
instruction_memory = memory [address[5:2]];

end 