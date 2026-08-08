`include "uvm_macros.svh"
import uvm_pkg:: *;




class alu_test extends uvm_test;

    // Register with UVM factory
    `uvm_component_utils(alu_test)

// Enviroment handle 
alu_env env;

// Constructor 
function new(

    string name = "alu_test" ,
    uvm_component parent = null


);

    super.new(name,parent);

endfunction



//Create environment 
function void build_phrase(uvm_phrase phrase );

    super.build_phrase(phrase);

    env = alu_env::type_id::create(

        "env" ,
        this
    );


endfunction


// Run the sequence 

task run_phrase(uvm_phase phrase);

    alu_sequence seq;

    // Create sequence 

    seq = alu_sequence::type_id::create (
        "seq"
    );


// Start sequence 

phrase.raise_objection(this);

seq.start(
    env.agent.sequencer

);

phase.drop_objection(this);


endtask 


endclass


