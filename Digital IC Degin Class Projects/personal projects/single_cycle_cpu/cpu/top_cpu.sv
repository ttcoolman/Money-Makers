module cpu_top(

    input logic clk,
    input logic reset,
    input logic enable, 

    output logic [31:0] pc_debug,
    output logic [31:0] instruction_debug,
    output logic [31:0] alu_result_debug
);

 // Internal wires
    logic [31:0] pc;
    logic [31:0] pc_plus4;
    logic [31:0] Branch_Address;
    logic Zero ; 
    logic [31:0] next_pc;

    logic [31:0] instruction;

    logic [6:0]  opcode;
    logic [4:0]  rd;
    logic [2:0]  funct3;
    logic [4:0]  rs1;
    logic [4:0]  rs2;
    logic [6:0]  funct7;

    logic RegWrite;
    logic ALUSrc;
    logic MemRead;
    logic MemWrite;
    logic Branch;
    logic [2:0] ALUControl;
    logic [2:0] ImmType;

    logic [31:0] immediate;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    logic [31:0] alu_input_b;
    logic [31:0] alu_result;
    logic Zero;
    logic [31:0] data_mem_read;
    logic [31:0] writeback_data;
    logic BranchTaken;


    // Next-state / datapath logic 

    assign pc_plus4 = pc + 32'd4;
    assign Branch_Address = pc + immediate ;
    assign BranchTaken = Branch & Zero;
    assign alu_input_b = ALUSrc ? immediate : read_data2;
    assign writeback_data = MemRead ? data_mem_read : alu_result;


    //Debug outputs 
    assign pc_debug = pc;
    assign instruction_debug = instruction;
    assign alu_result_debug = alu_result; 

//PC Mux 
pc_mux u_pc_mux (
.Branch_address(Branch_Address),
.pc_plus4(pc_plus4),
.Branch(BranchTaken),
.Zero(Zero) , 
.next_address(next_pc)
);



// Program Counter

pc u_pc (
.clk(clk),
.enable(enable),
.reset(reset),
.next_pc(next_pc),
.address(pc)



);




instruction_memory top(


.address(pc),

.instruction_memory(instruction)

);

//Decoder 

instruction_decoder u_decoder  (

.instruction(instruction), 
.opcode(opcode),
.rd(rd) , 
.rs1(rs1),
.rs2(rs2),
.funct3(funct3),
.funct7(funct7)


); 

// Control Unit 

control_unit u_control_unit (
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


// Register File 
register_file u_register_file (

.clk(clk),
.rd(rd),
.reg_write(RegWrite),
.write_data(writeback_data),
//Addresses of where the data is going to be read from 

.rs1(rs1),
.rs2(rs2),
.read_data1(read_data1),
.read_data2(read_data2)
);


//ALU 

alu u_alu (

.a(read_data1),
.b(ALUSrc ? immediate : read_data2),
.ALUControl(ALUControl),
.Zero(Zero),
.ALU_Result(alu_result)

);
//Data Memory 

data_memory u_data_memory (
.clk(clk),
.MemRead(MemRead),
.MemWrite(MemWrite),
.address(alu_result) ,
.write_data(write_data),
.read_data(read_data) ,


);

//WriteBack 
//For your single-cycle RISC-V CPU, the write-back data needs to choose between: ALU Result or Data Memory Output for LW 
assign writeback_data = MemRead ? data_mem_read : alu_result



