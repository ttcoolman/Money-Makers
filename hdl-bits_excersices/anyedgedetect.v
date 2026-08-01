module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    
    reg [7:0] oldin ; 
    integer i;
    
    
    always @(posedge clk)
        begin
            
            oldin <= in;
            
            for (i = 0; i<8 ; i= i + 1 )
                begin
                    if(   (in[i] ^ oldin[i]) == 1   )
                        begin 
                            
                            anyedge[i] <= 1;    
                         end 
                    
                   else 
                       begin
                         
                           anyedge[i] <= 0;    
                           
                           
                       end 
                    
                    
                 end
		            
            
         end 
    

endmodule
