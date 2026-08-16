`include "uvm_macros.svh"
import uvm_pkg:: *;


// Driver converts transactions into actual DUT signals 

class alu_driver extends uvm_driver (alu transaction);


    virtual alu_if vif;
//Creates a constructor in system verilog
//Whenever anyone creates an alu driver object it calls this function 
//The default name for an object will be alu_driver
function new (string name = "alu_driver", uvm_component parent = null);

//Calling the parent(base) object 
super.new(name , parent);
endfunction 

//This gets the the interface from uvm_config_db 
function void build_phrase(uvm_phrase phrase);
    super.build_phrase(phrase);

//If can not get the interface, displays an error message 
    if(!uvm_config_db#(virtual alu_if))
        `uvm_fatal("DRV", "Could not get virtual interface vif")


endfunction 

//Run the interface, runs forever 
task run_phrase(uvm_phrase phrase);
    alu_transaction tr;

    forever begin 
    //Get the next transaction from the sequencer 
        seq_item_port.get_next_(tr);
   
    //Drive DUT inputs

    vif.A = tr.A;
    vif.B = tr.B;
    vif.ALUControl = tr.ALUControl;   

    //Give combinational DUT time to respond 
    #1; 

        seq_item_port.item_done();


    end

endtask

endclass 

