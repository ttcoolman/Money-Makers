module axi_master #(
 parameter ADDR_WIDTH = 8,
 parameter DATA_WIDTH = 32

)(

//Define the control signals for each of the channels 




input logic aclk,
input logic aresetn,

    // Write address
    output logic [ADDR_WIDTH-1:0] m_axi_awaddr,
    output logic                 m_axi_awvalid,
    input  logic                 m_axi_awready,

    // Write data
    output logic [DATA_WIDTH-1:0] m_axi_wdata,
    output logic [DATA_WIDTH/8-1:0] m_axi_wstrb,
    output logic                  m_axi_wlast,
    output logic                  m_axi_wvalid,
    input  logic                  m_axi_wready,

    // Write response
    input  logic [1:0]            m_axi_bresp,
    input  logic                  m_axi_bvalid,
    output logic                  m_axi_bready,

    // Read address
    output logic [ADDR_WIDTH-1:0] m_axi_araddr,
    output logic                  m_axi_arvalid,
    input  logic                  m_axi_arready,

    // Read data
    input  logic [DATA_WIDTH-1:0] m_axi_rdata,
    input  logic [1:0]            m_axi_rresp,
    input  logic                  m_axi_rlast,
    input  logic                  m_axi_rvalid,
    output logic                  m_axi_rready

);


// Created enum with data type named state_t, with the different states 

typedef enum logic [2:0] {

IDLE,
WRITE_ADDR,
WRITE_DATA,
WRITE_RESP,
READ_ADDR,
READ_DATA,
DONE


}   state_t;


state_t state;  

logic [DATA_WIDTH - 1: 0] read_data;

// Initailize all the signals to zero 
always_ff@(posedge aclk) begin

if(!aresetn) begin
    state <= IDLE;

    //Write Address Signals 

    m_axi_awaddr <= '0;
    m_axi_awvalid <= 1'b0;
    
    //Write Data Singals 
    m_axi_wdata <= '0;
    m_axi_wstrb <= '0;
    m_axi_wlast <= 1'b0;
    m_axi_wvalid <= 1'b0;


    m_axi_bready <= 1'b0;

    m_axi_araddr <= '0;
    m_axi_arvalid <= 1'b0;




    m_axi_rready <= 1'b0;

    read_data <= '0;



end 


else

begin

case(state)
// --------------------------------
// START
// --------------------------------

IDLE: begin 
    m_axi_awaddr  <= 8'h10;
    m_axi_awvalid <= 1'b1;

state <= WRITE_ADDR;

end 

// --------------------------------

// WRITE ADDRESS

// --------------------------------

WRITE_ADDR: begin

if(m_axi_awvalid && m_axi_awready)begin
    //Master says that his address request is not valid 
    m_axi_awvalid <= 1'b0;
    //The data that the master is going to send to the slave 
    m_axi_wdata <= 32'h12345678;
    // The Masters sends all the bytes in the 32 bit instruction 
    m_axi_wstrb <= 4'b1111;
    // Master sends says it send the last beat in the write burst 
    m_axi_wlast <= 1'b1;
    m_axi_wvalid <= 1'b1;

    state <= WRITE_DATA;


end

end 


WRITE_DATA: begin

    if (m_axi_wvalid && m_axi_wready)

    begin
    //Master puts his hand down 
    m_axi_wvalid <= 1'b0;
    // Master says he sent the last beat in the burst  
    m_axi_wlast <= 1'b0;

    //Master says he is ready for the next state 
    m_axi_bready <= 1'b1;
    

    state <= WRITE_RESP;


    end 

end


// --------------------------------
// WRITE RESPONSE
// --------------------------------

WRITE_RESP: begin

if(m_axi_bvalid && m_axi_bready)begin
    
    m_axi_bready <= 1'b0;

    m_axi_araddr <= 8'h10;
    m_axi_arvalid <= 1'b1;


    state <= READ_ADDR; 





end 




end


// --------------------------------
// READ ADDRESS
// --------------------------------

READ_ADDR: begin

if(m_axi_arvalid && m_axi_arready)begin


m_axi_arvalid <= 1'b0;
m_axi_rready <= 1'b1;

state <= READ_DATA;




end 





end 

// --------------------------------
// READ DATA
// --------------------------------

READ_DATA: begin

if (m_axi_rvalid && m_axi_rready)begin

    read_data <= m_axi_rdata;

    m_axi_rready <= 1'b0;


    state <= DONE; 





end 


end
// --------------------------------
// DONE
// --------------------------------

DONE:begin


    state <= DONE;



end 



endcase 

end

endmodule

