`timescale 1ns/1ps


module program_counter_tb();

 logic clk;
 logic enable;
 logic reset;


 logic [31:0]address;



program_counter dut (

.clk(clk),
.enable(enable),
.reset(reset),
.address(address)

);


//Create a waveform
initial begin

$dumpfile("program_counter.vcd");
$dumpvars(0,program_counter_tb);

end 



// Initialize the values 


initial begin

clk = 0;


end 

always begin

#5 

clk = ~clk;

end


initial begin
reset = 1;
enable = 0;




#10

reset = 0;
enable = 1;


#40 


enable = 0;

#20 


$finish;




end


initial

begin

$monitor(

"Time = %0t  reset = %b enable = %b PC = %b ",

$time,
$reset,
$enable,
$address




);


end 


endmodule



