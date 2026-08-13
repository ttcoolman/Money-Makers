module pc_mux (

input logic [31:0] Branch_Address,
input logic [31:0] pc_plus4,
input logic Branch ,
input logic Zero, 


output logic [31:0] next_address 


);


assign next_address = (Branch & Zero) ? Branch_Address : pc_plus4 ; 

endmodule 


