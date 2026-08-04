module program_counter (

    input logic clk,
    input logic reset,
    input logic enable,
    output logic [31:0] pc



);


always_ff @(posedge clk)begin

if(reset)
begin 
    pc <= 32'h00000000;

end 

else
begin
if(enable)
    pc <= pc + 32'd4;
end 


end

    endmodule 


