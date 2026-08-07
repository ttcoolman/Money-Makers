`timescale 1ns/1ps


module pc_mux_tb;


    // Inputs
    logic [31:0] Branch_Address;
    logic [31:0] pc_plus4;
    logic Branch;


    // Output
    logic [31:0] next_address;



    // Instantiate DUT

    pc_mux dut (

        .Branch_Address(Branch_Address),
        .pc_plus4(pc_plus4),
        .Branch(Branch),
        .next_address(next_address)

    );



    // Generate waveform

    initial begin

        $dumpfile("pc_mux.vcd");
        $dumpvars(0, pc_mux_tb);

    end



    // Test cases

    initial begin


        // Test 1:
        // Branch not taken
        // Should choose PC + 4

        pc_plus4 = 32'h00000004;
        Branch_Address = 32'h00000020;
        Branch = 0;


        #10;


        if(next_address == pc_plus4)
            $display("PASS: Branch=0 selected PC+4");
        else
            $display("FAIL: Branch=0 incorrect");



        // Test 2:
        // Branch taken
        // Should choose branch address

        pc_plus4 = 32'h00000008;
        Branch_Address = 32'h00000040;
        Branch = 1;


        #10;


        if(next_address == Branch_Address)
            $display("PASS: Branch=1 selected Branch Address");
        else
            $display("FAIL: Branch=1 incorrect");



        $finish;


    end



    // Monitor signals

    initial begin

        $monitor(
            "Time=%0t Branch=%b PC+4=%h BranchAddr=%h NextPC=%h",
            $time,
            Branch,
            pc_plus4,
            Branch_Address,
            next_address
        );

    end


endmodule