
module branch(

input logic Branch,
input logic Zero,

output logic branch_taken

);
always_comb begin


if(Branch & Zero)
branch_taken = 1'b1;

else 
    branch_taken = 1'b0;


end 

endmodule