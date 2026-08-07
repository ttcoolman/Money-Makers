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

functio




endclass 