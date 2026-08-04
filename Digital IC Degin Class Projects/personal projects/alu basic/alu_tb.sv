`timescale 1ns/1ps


module alu_tb;

//Testbench signals 

logic [3:0] a;
logic [3:0] b;
logic [1:0] op;


logic [3:0] result;


//Instantiate DUT 

alu dut (

.a(a),
.b(b),
.op(op),
.result(result)




);

//Generate waveform

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);

    end

//Test sequence 

initial begin 

//ADD test

a = 4'd5;
b = 4'd3;
op = 2'b00;


#10;

check_result(8);

//SUB test 

a = 4'd7;
b = 4'd2;
op = 2'b01;


#10; 

check_result(5);


//AND test 


a = 4'b1100;
b = 4'b1010;
op = 2'b10;


#10;

check_result(4'b1000);


//OR test 

a = 4'b1100;
b = 4'b1010;
op = 2'b11;

#10

check_result(4'b1110);

$display("All tests completed");


$finish;


end 




//Automatic checker 


task check_result(input logic [3:0] expected );

        begin



        if(result != expected)

            $display(
                "FAIL: result = %b  expected = %b", 
                result,
                expected


            );


        else 

            $display(
                "PASS: result = %b",
                result 

            ); 


        end


        endtask

    endmodule





 



