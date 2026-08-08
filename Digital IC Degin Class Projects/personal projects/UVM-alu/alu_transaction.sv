
//Creates a class that a child of uvm_sequence 

class alu_transaction extends uvm_sequence_item;
    rand logic [3:0] A;
    rand logic [3:0] B;
    rand logic [2:0] ALUControl;

//Creates a constructior 
    function new (string name = "alu_transaction");
//Run the constructor 
        super.new(name);


    endfunction


endclass

