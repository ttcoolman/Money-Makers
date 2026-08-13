module register_file(

    input logic clk,

    input logic [4:0] rd,
    input logic reg_write,
    input logic [31:0] write_data,

    input logic [4:0] rs1,
    input logic [4:0] rs2,

    output logic [31:0] read_data1,
    output logic [31:0] read_data2

);

    logic [31:0] registers [0:31];

    initial begin

        integer i;

        for (i = 0; i < 32; i = i + 1)
            registers[i] = 32'b0;

    end

    assign read_data1 = registers[rs1];
    assign read_data2 = registers[rs2];

    always_ff @(posedge clk) begin

        if (reg_write) begin

            if (rd != 5'd0)
                registers[rd] <= write_data;

        end

    end

endmodule