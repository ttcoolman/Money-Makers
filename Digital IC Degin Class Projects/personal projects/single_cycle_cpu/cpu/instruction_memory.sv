module instruction_memory(

input logic [31:0]address,

//Creates a word buffer 
 output logic [31:0] instruction




);

//Creates a stack of words 
logic [31:0] memory [0:15];



initial begin

        memory[0] = 32'h00000013;
        memory[1] = 32'h00100093; // ADDI x1,x0,1
        memory[2] = 32'h00200113; // ADDI x2,x0,2
        memory[3] = 32'h003081B3; // ADD x3,x1,x2

        memory[4] = 32'h00000013;
        memory[5] = 32'h00000013;

        memory[6] = 32'h00000013;
        memory[7] = 32'h00000013;
        memory[8] = 32'h00000013;
        memory[9] = 32'h00000013;
        memory[10] = 32'h00000013;
        memory[11] = 32'h00000013;
        memory[12] = 32'h00000013;
        memory[13] = 32'h00000013;
        memory[14] = 32'h00000013;
        memory[15] = 32'h00000013;




end 


//Instruction fetch 

//Fetching the instruction from the pc and putting into the sram 
always_comb begin 

//Cache has 16 words because of the 4 bits and also starts at the third bit because of byte indexing 
instruction = memory [address[5:2]];

end 

endmodule 