module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge

);
    
        reg [7:0]old_in; 
    	integer i;
    
    always@ (posedge clk)
        begin
        
            
       old_in <= in;
            
           for (i = 0; i < 8; i = i + 1) begin
    if (~old_in[i] & in[i])
        pedge[i] <= 1'b1;
    else
        pedge[i] <= 1'b0;
end
    
        end 

endmodule
