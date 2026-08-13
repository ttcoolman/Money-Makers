module control_unit(

    input logic [6:0] opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,

    output logic RegWrite,
    output logic ALUSrc,
    output logic MemRead,
    output logic MemWrite,
    output logic Branch,
    output logic [2:0] ALUControl,
    output logic [2:0] ImmType

);

    always_comb begin

        // Default control values
        RegWrite   = 1'b0;
        ALUSrc     = 1'b0;
        MemRead    = 1'b0;
        MemWrite   = 1'b0;
        Branch     = 1'b0;
        ALUControl = 3'b000;
        ImmType    = 3'b000;

        case (opcode)

            // R-Type
            7'b0110011: begin

                RegWrite = 1'b1;
                ALUSrc   = 1'b0;

                // ADD
                if ((funct7 == 7'b0000000) && (funct3 == 3'b000))
                    ALUControl = 3'b000;

                // SUB
                else if ((funct7 == 7'b0100000) && (funct3 == 3'b000))
                    ALUControl = 3'b001;

                // AND
                else if ((funct7 == 7'b0000000) && (funct3 == 3'b111))
                    ALUControl = 3'b010;

                // OR
                else if ((funct7 == 7'b0000000) && (funct3 == 3'b110))
                    ALUControl = 3'b011;

                // SLT
                else if ((funct7 == 7'b0000000) && (funct3 == 3'b010))
                    ALUControl = 3'b100;

            end

            // ADDI
            7'b0010011: begin

                RegWrite   = 1'b1;
                ALUSrc     = 1'b1;
                ALUControl = 3'b000;
                ImmType    = 3'b000;

            end

            // LW
            7'b0000011: begin

                RegWrite   = 1'b1;
                ALUSrc     = 1'b1;
                MemRead    = 1'b1;
                ALUControl = 3'b000;
                ImmType    = 3'b000;

            end

            // SW
            7'b0100011: begin

                ALUSrc     = 1'b1;
                MemWrite   = 1'b1;
                ALUControl = 3'b000;
                ImmType    = 3'b001;

            end

            // BEQ
            7'b1100011: begin

                Branch     = 1'b1;
                ALUSrc     = 1'b0;
                ALUControl = 3'b001;
                ImmType    = 3'b010;

            end

            default: begin

                RegWrite   = 1'b0;
                ALUSrc     = 1'b0;
                MemRead    = 1'b0;
                MemWrite   = 1'b0;
                Branch     = 1'b0;
                ALUControl = 3'b000;
                ImmType    = 3'b000;

            end

        endcase

    end

endmodule