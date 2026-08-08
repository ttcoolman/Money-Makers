`include "uvm_macros.svh"
import uvm_pkg::*;

//Sequencer provides transactions 

//Class declaration
class alu_sequencer extends uvm_sequencer #(alu_transaction);

// Register with UVM factory(this allows UVM to create it dynamically)
`uvm_component_utils(alu_sequencer)

//Constructor 

function new(
    string name = "alu_sequencer",
    uvm_component parent = null;
);
//Runs the constructor 
super.new(name,parent);

endfunction



endclass