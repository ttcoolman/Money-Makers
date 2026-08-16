// AXI Slave is a simple RAM stick, with 8 address pins, and 32 data pins: 256 X 32 RAM Stick 




module axi_slave #(
parameter ADDR_WIDTH = 8,
parameter DATA_WIDTH = 32

)(
    input logic     aclk,
    input logic    aresetn,

    //Write address chanel: for the Master writing to the Slave 

    // Address where the master wants to write to 
    input logic [ADDR_WIDTH - 1 : 0 ] s_axi_awaddr,
    // Valid Bit meaning: Master: "The address I'm giving you is valid "
    input logic  s_axi_awvalid,
    // Ready Bit meaning : Slave: "I'm ready to accept your write address" 
    output logic s_axi_awready,




    // Write data chanel 
    // This is thia data that the master wants to write 
    input logic [DATA_WIDTH - 1 : 0] s_axi_wdata,
    // Write Strobe: It tells the slave which bytes inside WDATA should actually be written 
    input logic [DATA_WIDTH/8 - 1 : 0] s_axi_wstrb,
    // This signal tells when the slave that is the last piece of data(beat) in the burst transfer of 4 bits 
    input logic s_axi_wlast,

   // Valid Bit: The master says :"my data is valid" for a burst transfer of 4 bits 
    input logic s_axi_wvalid,

    //Slave saying : Im ready to accept the write data 
    output logic s_axi_wready,


    // Write response chanel 

    // Write response: tells the master whether the write transaction succeeded
    output logic [1:0] s_axi_bresp,
    //Valid Bit: Slave Saying that the beat response is ready : (bresp) 
    output logic s_axi_bvalid,
    //Ready Bit: Master saying that "I am ready to hear your beat response (bresp) "
    input logic s_axi_bready,

    //Read address channel

    // Masters tells slave: "I want to read from this address"
    input logic [ADDR_WIDTH-1:0] s_axi_araddr,
    // Master tells slave: The address I want to read from is valid 
    input logic s_axi_arvalid,
    // Slave saying he is ready to give the address
    output logic s_axi_arready, 

    //Read data channel 
//The data that is being read from the slave
    output logic [DATA_WIDTH-1:0]  s_axi_rdata,

    output logic [1:0]             s_axi_rresp,
//Signal indictating the last beat of the burst transfer 
    output logic                   s_axi_rlast,
// Valid bit: "Master the RDATA, RRESP, and RLAST right now are valid"
    output logic                   s_axi_rvalid,
//Master: "Slave, I am ready to accept your read data"
    input  logic                   s_axi_rready

);
// Establish the RAM stick 
logic [DATA_WIDTH - 1 : 0] mem [0: 255];

logic [ADDR_WIDTH - 1 : 0] write_addr;

integer i;


always_ff @(posedge aclk) begin
    
    if(!aresetn) begin

//Initialize the signals that the slaves are controlling 
        s_axi_awready <= 1'b0;
        s_axi_wready <= 1'b0;
        s_axi_bvalid <= 1'b0;
        s_axi_bresp <= 2'b00;       


        s_axi_arready <= 1'b0;
        s_axi_rvalid <= 1'b0;
        s_axi_rdata <= '0;
        s_axi_rresp <= 2'b00;
        s_axi_rlast <= 1'b0;

        write_addr <= '0;

        for (i = 0; i < 256; i = i + 1)
            mem[i] <= '0;      



    end 

else begin


// --------------------------------
// WRITE ADDRESS
// --------------------------------
//Slave is ready for the address from the master 
s_axi_awready <= 1'b1 ;

//If valid and ready write the address to the slave, and make sure the slave is not ready for another address
if (s_axi_awvalid && s_axi_awready)
begin
    
    write_addr <= s_axi_awaddr;
    s_axi_awready <= 1'b0;


end 

// --------------------------------
// WRITE DATA
// -------------------------------

s_axi_wready <= 1'b1;

if (s_axi_wready && s_axi_wvalid)
    begin

        mem[write_addr] <= s_axi_wdata;
        // I have a valid write response for you 
        s_axi_bvalid <= 1'b1;
        //The write completed successfully 
        s_axi_bresp <= 2'b00; //OKAY
        // I'm no longer ready to accept another write-data beat 
        s_axi_wready <= 1'b0; 


    end 

    // --------------------------------
    // WRITE RESPONSE
    // --------------------------------
     if (s_axi_bvalid && s_axi_bready) begin
                s_axi_bvalid <= 1'b0;
            end

  // --------------------------------
  // READ ADDRESS
  // --------------------------------
        //The Master is ready to read the slave address 
            s_axi_arready <= 1'b1;
    //If the Master is ready to read the address, and the Slave address is valid to read 
            if (s_axi_arvalid && s_axi_arready) begin
            //Put the data from the slave to the master 
                s_axi_rdata <= mem[s_axi_araddr];
                s_axi_rresp <= 2'b00; // OKAY
                s_axi_rlast <= 1'b1;
                s_axi_rvalid <= 1'b1;
            //The Master says he does not need data 
                s_axi_arready <= 1'b0;
            end  

 // --------------------------------
 // READ DATA 
 // --------------------------------
    // Once the data transfer succeeds, the master says he does not need the data, however the slave should not dicatate the rready signal 
    if(s_axi_rvalid & s_axi_rready)
    begin
        s_axi_rvalid <= 1'b0;
        s_axi_rlast <= 1'b0;
    end 

end




end

endmodule
