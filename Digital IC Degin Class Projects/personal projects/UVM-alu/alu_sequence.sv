`include "uvm_macros.svh"
import uvm_pkg:: *;

//Creates a seqenunce class
class alu_sequence extends uvm_sequence #(alu_transaction);


function new (string name = "alu_sequence");
    super.new(name);

endfunction 


// Main sequence task
task body();

    alu_transaction tr;

    // Create 10 ALU transactions

    repeat(10) begin

    // Create transaction object 
    tr = alu_transaction::type_id::create("tr");


    //Give transaction to driver 
    start_item(tr);


//  Randomize inputs 
if(!tr.randomize())

begin

    `uvm_error ("SEQ", "Randomizaion failed")


end 


//Send transaction 

finsh_item(tr); 



    end 


endtask 

endclass


