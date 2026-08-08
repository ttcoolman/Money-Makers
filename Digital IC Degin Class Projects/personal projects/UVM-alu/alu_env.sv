`include "uvm_macros.sch"
import uvm_pkg:: *;

class alu_env extends uvm_env;

// Register with UVM 

`uvm_component_utils(alu_env)


// Components inside enviroment 
alu_agent agent;
alu_scoreboard scoreboard;

//Constructor 

function new (

    string name = "alu_env ",
    uvm_component parent = null 
);

super.new(name,parent); 

endfunction 


// Create components 

function void build_phrase(uvm_phrase phrase);

    super.build_phrase(phrase);

    agent = alu_agent::type_id::create(
        "agent" ,
        this 
    );


   scoreboard = alu_scoreboard::type_id::create(
    "scoreboard" ,
    this
   );

endfunction

// Connect components 

function void connect_phrase(uvm_phrase phrase);

    super.connect_phrase(phrase);

    // Connect monitor to scoreboard 

    agent.monitor.analysis_port.connect(


        scoreboard.analysis_export
    );


