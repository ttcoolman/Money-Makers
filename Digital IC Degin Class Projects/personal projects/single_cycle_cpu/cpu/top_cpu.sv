module cpu_top(

    input logic clk,
    input logic reset,

    output logic [31:0] pc_debug,
    output logic [31:0] instruction_debug,
    output logic [31:0] alu_result_debug

);

    // =========================================================
    // PC signals
    // =========================================================

    logic [31:0] pc;
    logic [31:0] pc_plus4;
    logic [31:0] branch_address;
    logic [31:0] next_pc;

    // =========================================================
    // Instruction signals
    // =========================================================

    logic [31:0] instruction;

    logic [6:0] opcode;
    logic [4:0] rd;
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [2:0] funct3;
    logic [6:0] funct7;

    // =========================================================
    // Control signals
    // =========================================================

    logic RegWrite;
    logic ALUSrc;
    logic MemRead;
    logic MemWrite;
    logic Branch;

    logic [2:0] ALUControl;
    logic [2:0] ImmType;

    // =========================================================
    // Datapath signals
    // =========================================================

    logic [31:0] immediate;

    logic [31:0] read_data1;
    logic [31:0] read_data2;

    logic [31:0] alu_input_b;
    logic [31:0] alu_result;
    logic Zero;

    logic [31:0] data_mem_read;
    logic [31:0] writeback_data;


    // =========================================================
    // PC logic
    // =========================================================

    assign pc_plus4 = pc + 32'd4;

    assign branch_address = pc + immediate;

    // Choose ALU input B
    assign alu_input_b = ALUSrc ? immediate : read_data2;

    // Choose data written back to register file
    assign writeback_data = MemRead ? data_mem_read : alu_result;


    // =========================================================
    // Debug outputs
    // =========================================================

    assign pc_debug = pc;

    assign instruction_debug = instruction;

    assign alu_result_debug = alu_result;


    // =========================================================
    // Program Counter
    // =========================================================

    program_counter u_pc(

        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .address(pc)

    );


    // =========================================================
    // Instruction Memory
    // =========================================================

    instruction_memory u_instruction_memory(

        .address(pc),
        .instruction(instruction)

    );


    // =========================================================
    // Instruction Decoder
    // =========================================================

    instruction_decoder u_instruction_decoder(

        .instruction(instruction),

        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7)

    );


    // =========================================================
    // Control Unit
    // =========================================================

    control_unit u_control_unit(

        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),

        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),

        .ALUControl(ALUControl),
        .ImmType(ImmType)

    );


    // =========================================================
    // Immediate Generator
    // =========================================================

    immediate_generator u_immediate_generator(

        .instruction(instruction),
        .imm_type(ImmType),
        .immediate(immediate)

    );


    // =========================================================
    // Register File
    // =========================================================

    register_file u_register_file(

        .clk(clk),

        .rd(rd),
        .reg_write(RegWrite),
        .write_data(writeback_data),

        .rs1(rs1),
        .rs2(rs2),

        .read_data1(read_data1),
        .read_data2(read_data2)

    );


    // =========================================================
    // ALU
    // =========================================================

    alu u_alu(

        .a(read_data1),
        .b(alu_input_b),

        .ALUControl(ALUControl),

        .Zero(Zero),
        .ALU_Result(alu_result)

    );


    // =========================================================
    // Data Memory
    // =========================================================

    data_memory u_data_memory(

        .clk(clk),

        .MemRead(MemRead),
        .MemWrite(MemWrite),

        .address(alu_result),
        .write_data(read_data2),

        .read_data(data_mem_read)

    );


    // =========================================================
    // PC MUX
    // =========================================================

    pc_mux u_pc_mux(

        .Branch_Address(branch_address),
        .pc_plus4(pc_plus4),
        .Branch(Branch),
        .Zero(Zero),

        .next_address(next_pc)

    );

endmodule