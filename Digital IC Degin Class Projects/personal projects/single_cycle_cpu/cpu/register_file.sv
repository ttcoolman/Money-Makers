module register_file(

input logic clk,

//Write Register Parameters 
input logic [4:0]rd,
input logic reg_write,
input logic [31:0] write_data,



//Addresses of where the data is going to be read from 
input logic [4:0]rs1,
input logic [4:0]rs2,


output logic [31:0] read_data1,
output logic [31:0] read_data2


);

//Initalize registers 
logic [31:0] registers [31:0],

initial begin

integer i;

for(i=0 ; i<32 ; i = i + 1)begin


registers[i] = 32'b0;





end 





end


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





