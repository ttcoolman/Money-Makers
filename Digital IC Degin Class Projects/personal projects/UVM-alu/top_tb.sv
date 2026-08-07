module top_tb;

    alu_if alu_interface();

alu dut (

.A(alu_interface.A),
.B(alu_interface.B),


.ALUControl(alu_interface.ALUContol),

.Result(alu_interface.Result)




);

endmodule