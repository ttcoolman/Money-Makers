module program_counter(
input logic clk,
input logic enable,
input logic reset,
input logic [31:0] next_pc,
output logic [31:0]address



);




always_ff@(posedge clk)begin

if(reset)

begin

address <= 32'h00000000;


end 


else 
begin

if(enable)
begin

    address <= next_pc;

end 


end 



end 



endmodule