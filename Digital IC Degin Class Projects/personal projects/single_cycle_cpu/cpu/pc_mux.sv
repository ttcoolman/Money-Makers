module pc_mux (

input logic [31:0] Branch_Address,
input logic [31:0] pc_plus4,
input logic Branch , 


output logic [31:0] next_address 


);


assign next_address = Branch ? Branch_Address : pc_plus4 ; 

endmodule 


