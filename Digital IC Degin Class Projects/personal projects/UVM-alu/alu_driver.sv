`include "uvm_macros.svh"
import uvm_pkg:: *;




class alu_driver extends uvm_driver (alu transaction);


    virtual alu_if vif;
//Creates a constructor in system verilog
//Whenever anyone creates an alu driver object it calls this function 
//The default name for an object will be alu_driver
function new (string name = "alu_driver", uvm_component parent = null);
super.new(name , parent);
endfunction 

//This gets the the interface from uvm_config_db 
function void build_phrase(uvm_phrase phrase);
    super.build_phrase(phrase);


    if(!uvm_config_db#(virtual alu_if))




endclass 