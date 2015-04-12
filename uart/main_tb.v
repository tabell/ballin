`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:40:25 04/11/2015
// Design Name:   main
// Module Name:   /home/alex/verilog/misc/uart//main_tb.v
// Project Name:  uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_tb;

	// Inputs
	reg clk;
	reg clk_en;
	reg [7:0] q_in;
	reg trigger;

	// Outputs
	wire s_out;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.clk_en(clk_en), 
		.q_in(q_in), 
		.trigger(trigger), 
		.busy(busy),
		.s_out(s_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clk_en = 0;
		q_in = 0;
		trigger = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		clk_en <= 1;
        trigger <= 1;
        q_in <= 8'b11110000;
        #10 trigger <= 0;

        #220;
        trigger <= 1;
        q_in <= 8'b00000000;
        #10 trigger <= 0;
		// Add stimulus here

	end
	always begin
		#5 clk <= ~clk;
	end
      
endmodule

