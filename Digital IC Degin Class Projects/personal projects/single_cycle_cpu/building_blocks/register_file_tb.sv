`timescale 1ns/1ps


module register_file_tb;

// =Define the variables that are used in the register_file.sv
logic clk;

logic [4:0] rs1;
logic [4:0] rs2;

logic [4:0] rd;

logic [31:0] write_data;

logic reg_write;

logic [31:0] read_data1;
logic [31:0] read_data2;



register_file dut(

.clk(clk),


.rs1(rs1),
.rs2(rs2),

.rd(rd),
.write_data(write_data),

.reg_write(reg_write),

.read_data1(read_data1),
.read_data2(read_data2)


);




initial begin 

    clk = 0;


end 

always #5 clk = ~clk;


initial begin

    $dumpfile("register_file.vcd");
    $dumpvars(0,register_file_tb);


end


initial begin 

// Initial values 

reg_write = 0;
rd =0;
write_data = 0;


rs1 = 0;
rs2 = 0;


#10;

// Write x1 = 100


rd = 5'd1;
//write_data is the data we are writing and reg_write is the CS control to write to the register file 
write_data = 32'd100;
reg_write = 1;

#10;

//Stop writing 


reg_write = 0;

// Read x1

rs1 = 5'd1;

#10;

$display(
    "x1 value" = %d,
    read_data1


);





$finish;

end



endmodule
