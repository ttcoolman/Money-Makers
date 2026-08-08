`timescale 1ns/1ps


module instruction_decoder_tb;

logic [31:0] address;
logic [6:0] opcode;
logic [4:0] rd;
logic [2:0] funct3;
logic [4:0] rs1;
logic [4:0] rs2;
logic [6:0] funct7;

instruction_decoder dut(

.address(address),
.opcode(opcode),
.rd(rd),
.funct3(funct3),
.rs2(rs2),
.funct7(funct7)
    
);

initial begin

instruction = 32'h00100093;
#10
$display("opcode =%b rd =%d funct3 = %b rs1 = %d rs2 = %d funct7 = %b",

opcode, rd , funct3, rs1, rs2 , funct7

);

$finish;

end 

endmodule