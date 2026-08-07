`include "uvm_macros.svh"
import uvm_pkg:: *;




class alu_driver extends uvm_driver (alu transaction);


    virtual alu_if vif;


vif.A <= transaction.A;
vif.B <= transaction.B;
vif.ALUControl <= transaction.ALUControl;



endclass 