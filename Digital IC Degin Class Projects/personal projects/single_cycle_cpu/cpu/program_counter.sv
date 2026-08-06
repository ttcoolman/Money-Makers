module program_counter(
input logic clk,
input logic enable,
input logic reset,



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

    address = address + 32'd4;

end 


end 



end 



endmodule