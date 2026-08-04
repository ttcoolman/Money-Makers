module register_file (

input logic clk,

//Read addresses 
input logic [4:0] rs1,
input logic [4:0] rs2,


//Write address and data 

input logic [4:0] rd 
input logic [31:0] write_data,

//Enable writing
input logic reg_write,


// Outputs 

output logic [31:0] read_data1,
output logic [31:0] read_data2






);



// Initialize registers 

initial begin 


integer i;

for (i = 0 ; i < 32 , i = i + 1)
    registers[i] = 32'b0;






end



//Read ports 

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];




//Write port 

always_ff @(posedge clk )begin

if(reg_write)
begin
//x0 is always zero in RISC-V
if(rd != 0)
    registers[rd] <= write_data;



end


end 



endmodule











end