`include "uvm_macros.svh"
import uvm_pkg:: *;

// Create a components and connects the componenets 

class alu_agent extends uvm_agent;

// Register with UVM factory

`uvm_component_utils(alu_agent)

//Declare components 
alu_driver driver;
alu_sequencer sequencer;
alu_monitor monitor;


//Constructor 

function new(
    string name = "alu_agent" ,
    uvm_component parent = null 



);


super.new(name,parent);


endfunction 


//Build phrase 

//This gets the the interface from uvm_config_db 
function void build_phrase(uvm_phrase phrase);
    super.build_phrase(phrase);

//Create a sequencer 

sequencer = alu_sequencer::type_id::create(
    "sequencer",
    this 
); 


//Create driver 

driver = alu_driver::type_id::create(
    "driver",
    this 
);


//Create monitor

monitor = alu_monitor::type_id::create(
    "monitor",
    this 
);

endfunction 

// Connect phrase 

function void connect_phrase(uvm_phrase phrase);

    super.connect_phrase(phrase);

// Connect sequencer to driver 

driver.seq_item_port.connect(
    sequencer.seq_item_export
);


endfunction 

endclass




