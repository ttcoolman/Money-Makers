module axi_slave #(
parameter ADDR_WIDTH = 8,
parameter DATA_WIDTH = 32

)
    input logic     aclk,
    input logic    aresetn,


    //Write address chanel 
    input l