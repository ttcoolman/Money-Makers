//////////////////////////////////////////////////////////////////////////////////
// Author:			Brandon Franzke, Gandhi Puvvada, Bilal Zafar
// Create Date:   	02/13/2008, 
// Revised: Gandhi 2/6/2012 replaced `define with localparam
// File Name:		ee354_detour_sm.v 
// Description: 
//
//
// Revision: 		1.1
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ee354_numlock_sm(clk, reset, q_I, q_G1get, q_G1, q_G10get,q_G10,q_G101get,q_G101,q_G1011get,q_G1011,q_Opening,q_Bad,U,Z,Unlock);

	/*  INPUTS */
	// Clock & Reset
	input clk, reset;
	input U, Z; 
	
	/*  OUTPUTS */
	// store current state
	output q_I, q_G1get, q_G1, q_G10get,q_G10,q_G101get,q_G101,q_G1011get,q_G1011,q_Opening,q_Bad;
	output Unlock; 
	reg [10:0] state;	
	
	assign {q_Bad,q_Opening,q_G1011,q_G1011get,q_G101,q_G101get,q_G10,q_G10get,q_G1,q_G1get,q_I} = state;
		
	// lets make accessing the state information easier within the state machine code
	// each line aliases the approriate state bits and sets up a 1-hot code
	localparam
	    QI		= 11'b00000000001,
	    QG1GET	= 11'b00000000010,
	    QG1	=     11'b00000000100,
	    QG10GET=  11'b00000001000,
	    QG10	= 11'b00000010000,
	    QG101GET= 11'b00000100000,
	    QG101	= 11'b00001000000,
	    QG1011GET=11'b00010000000,
	    QG1011	= 11'b00100000000,
	    QOPENING= 11'b01000000000,
		QBAD =    11'b10000000000,
		UNK = 11'bXXXXXXXXXXX;
	   
	
	// our output leds (leftleft, left, right, rightright)
	reg [3:0] Timerout_count;
	wire Timerout;
	assign Timerout = (Timerout_count[3]) & (Timerout_count[2]) & (Timerout_count[1]) & (Timerout_count[0]);

	always @ (posedge clk, posedge reset)
	begin : TIMEROUT_COUNT
		if(reset)
			Timerout_count <= 0;
		else
			if(state == QOPENING)
				Timerout_count <= Timerout_count +1;
			else
				Timerout_count <=0;
	end
	

	// NSL AND SM
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
			state <= QI;
		else 
		begin
			case(state)
				QI:
					// dont worry about async reset here because 'if' statement considers this first
					if(U==1 && Z==0)
						// switch left
						state <= QG1GET;
				QG1GET:
					if(U==0)
						state<=QG1;
						// switch right
				QG1:
				begin
					if(U==0 && Z==1)
						state <= QG10GET;
					else if (U==1)
						state <= QBAD;
				end
				QG10GET:
					if(Z==0)
						state<=QG10;
				QG10:
				begin
					if(U==1 && Z==0)
					begin
						state <= QG101GET;
				    end
					else if (Z==1)
					begin 
						state <= QBAD;
					end
				end
				QG101GET:
					if(U==0)
						state<=QG101;
				QG101:
				begin
					if(U==1 && Z==0)
						state <= QG1011GET;
					else if (Z==1)
						state <= QBAD;
				end
				QG1011GET:
					if(U==0)
						state<=QG1011;
				QG1011:
					state <= QOPENING;
				QOPENING:
					if(Timerout == 1)
						state <= QI;
				QBAD:
				    if(U==0 && Z==0)
				        state <= QI;

				// these are pretty boring, just unconditionals
				
				default:	state <= UNK;
			endcase
		end
	end
	
	
	// OFL
	assign Unlock = q_Opening;

	
endmodule
