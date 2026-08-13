module program_counter(

    input logic clk,
    input logic reset,
    input logic [31:0] next_pc,

    output logic [31:0] address

);

    always_ff @(posedge clk) begin

        if (reset)
            address <= 32'b0;

        else
            address <= next_pc;

    end

endmodule