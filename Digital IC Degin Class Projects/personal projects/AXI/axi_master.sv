module axi_master (
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


always_ff@(posedge aclk) begin

if(!aresetn) begin
    state <= IDLE;

    //Write Address Signals 

    m_axi_awaddr <= '0;
    m_axi_awvalid <= 1'b0;
    

    //Write Data Strobe 












end





end 










)



