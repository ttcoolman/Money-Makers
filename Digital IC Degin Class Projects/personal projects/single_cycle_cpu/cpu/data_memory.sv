module data_memory(

input logic clk,
input logic MemRead,
input logic MemWrite,
input logic [31:0] address,
input logic [31:0] write_data,
output logic [31:0] read_data 





);

//Size of DRAM 
logic [31:0] memory [0:255]; //256 words = 1KB 

// Optional initialization 


initial begin
    integer i;
    for (i = 0 ; i < 256 ; i = i + 1)
        memory[i] = 32'b0;


end 


//Asynchronous read 

always_comb begin
    if(MemRead)
    read_data = memory[address[31:2]];
    else 
        read_data = 32'b0;



end


// Synrchous Write 
always_ff @(posedge clk ) begin 
  if(MemWrite)  
    memory[address[31:2]] <= write_data;

end


endmodule