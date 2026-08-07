module alu(

    input logic [3:0] A,
    input logic [3:0] B,

    input logic [2:0] ALUControl,

    output logic [3:0] Result

);

always_comb begin

    case(ALUControl)

        3'b000:
            Result = A + B;

        3'b001:
            Result = A - B;

        3'b010:
            Result = A & B;

        3'b011:
            Result = A | B;

        default:
            Result = 0;

    endcase

end

endmodule