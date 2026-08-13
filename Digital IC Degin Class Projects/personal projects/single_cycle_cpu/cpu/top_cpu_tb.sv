`timescale 1ns/1ps



module top_cpu_tb;

//Testbench 


logic clk;
logic reset;



logic [31:0] pc_debug;
logic [31:0] instruction_debug;
logic [31:0] alu_result_debug;


//
//Instaniate CPU 

cpu_top dut (
    

    .clk(clk),
    .reset(reset),

    .pc_debug(pc_debug),
    .instruction_debug(instruction_debug),
    .alu_result_debug(alu_result_debug)
);

// Clock generation 
// 10 ns period 


initial begin


    clk = 0;

end 


always begin 


#5 clk = ~clk;


end 



// Generate waveform 

initial begin

    $dumpfile("cpu.vcd");

   $dumpvars(0, top_cpu_tb);

    end


    // =========================================================
    // Test sequence
    // =========================================================

    initial begin

        // Apply reset
        reset = 1;

        #10;


        // Release reset
        reset = 0;


        // Let CPU execute instructions
        #100;


        $finish;

    end


    // =========================================================
    // Monitor CPU
    // =========================================================

    initial begin

        $monitor(
            "Time=%0t | PC=%h | Instruction=%h | ALU_Result=%h",
            $time,
            pc_debug,
            instruction_debug,
            alu_result_debug
        );

    end

endmodule
