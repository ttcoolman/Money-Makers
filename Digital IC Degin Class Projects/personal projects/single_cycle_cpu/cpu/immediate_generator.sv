module immediate_generator(
input logic [31:0]instruction,
//Imm-type is determined by the type of instruction
output logic [2:0]imm_type,
output logic [31:0]immediate

);


always_comb begin 



// I-type: ADDI, LW, etc. 
    3'b000: begin 

        immediate = {instruction[31:20], 20{0}};

    end 

// S-Type : SW 
    3'b001:begin

        immediate = {20}


    end

// B-Type : BEQ 
    3'b010: begin

        immediate = {instruction[31],instruction[7], instruction[30]}


    end 

// U-Type Instruction: LUI 

    3'b011:begin




    end

//J-Type:JAL 


3'b100: begin




end 


end

    




