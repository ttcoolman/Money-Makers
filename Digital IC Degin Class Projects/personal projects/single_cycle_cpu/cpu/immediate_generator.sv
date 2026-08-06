module immediate_generator(
input logic [31:0]instruction,
//Imm-type is determined by the type of instruction
output logic [2:0]imm_type,
output logic [31:0]immediate

);


always_comb begin 


case(imm_type)
// I-type: ADDI, LW, etc. 
    3'b000: begin 

        immediate = {20{instruction[20]},instruction[31:20]};

    end 

// S-Type : SW 
    3'b001:begin

        immediate = {20{instruction[31]}, instruction[31:25], instruction[11:7]};


    end

// B-Type : BEQ 
    3'b010: begin

        immediate = {18{instruction[31]}, instruction[7], instruction[30:25], instruction[11:8], 0};


    end 

endcase 

end

    




