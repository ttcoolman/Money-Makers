module alu(

    input logic [31:0] a,
    input logic [31:0] b,
    input logic [2:0] ALUControl,

    output logic Zero,
    output logic [31:0] ALU_Result

);

    always_comb begin

        // Default values
        ALU_Result = 32'b0;

        case (ALUControl)

            // ADD
            3'b000:
                ALU_Result = a + b;

            // SUB
            3'b001:
                ALU_Result = a - b;

            // AND
            3'b010:
                ALU_Result = a & b;

            // OR
            3'b011:
                ALU_Result = a | b;

            // SLT
            3'b100:
                ALU_Result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;

            default:
                ALU_Result = 32'b0;

        endcase

        // Zero is true whenever the ALU result is zero
        Zero = (ALU_Result == 32'b0);

    end

endmodule