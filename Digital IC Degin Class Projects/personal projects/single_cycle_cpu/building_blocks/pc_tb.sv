

//Creates a clock frequency
`timescale  1ps/1ps





//Creates a testbench module 
    module program_counter_tb;

    //Define the variables that are going to be in the testbench 
    logic clk;
    logic reset;
    logic enable;


    logic [31:0]pc;

    //Instantiate DUI

    program_counter dut (


        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pc(pc)
    );


    //
    //Clock generation
    //

    initial begin

        clk = 0;

    end


    always begin
        #5 clk = ~clk;

    end


    //
    //Generate waveform
    //

    initial begin
        
        $dumpfile("pc.vcd");
        $dumpvars(0, program_counter_tb );

    end


//
// Test sequence 
//

initial begin

    //Initial values 

    reset = 1;
    enable = 0; 



    #10;


    //Release reset 
    reset = 0;
    enable = 1;



    // Let PC increment 
    #40;


    //Stop PC 
    enable = 0;


    #20;

    $finish;


    end 


    //
    // Monitor output 
    //

    initial begin 

        $monitor(
            "Time = %0t  reset = %b enable = %b PC = %h",
            $time,
            reset,
            enable,
            pc

        );
    end  


    endmodule  







