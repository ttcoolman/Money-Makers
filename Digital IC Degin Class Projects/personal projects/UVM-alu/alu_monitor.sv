
// Monitor watches the DUT 


class alu_monitor extends uvm_monitor;

//Creates a constructor
function new (string name = "alu_monitor", uvm_component parent = null);

//Calling the parent(base) object 
super.new(name , parent);
endfunction 

//Build phrase 

function void build_phrase(uvm_phrase phrase );

    super.build_phrase(phrase);


    //Get virtual interface 

   if(!uvm_config_db#(virtual alu_if)::get(this, "", "vif", vif))
        begin

            `uvm_fatal("MONITOR",
            "Virtual interface not found")

        end

    //Create analysis port(allows for the connection to the scoreboard)
    analysis_port = new(

"analysis_port",
this 

    );


endfunction


//Monitor execution

task run_phrase(uvm_phrase phrase )

    alu_transaction tr;

forever begin 


    tr = alu_transaction::type_id::create("tr");

    //Sample DUT inputs 

    tr.A = vif.A ;
    
    tr.B = vif.B;

    tr.ALUControl = vif.ALUControl;

    //Sample DUT outputs 

    tr.Result = vif.Result; 


    // Send transaction to scoreboard 

    analysis_port.write(tr);


    //Wait before sampling again 

    #1; 



end 

endtask 



endclass 