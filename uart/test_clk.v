`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:42 04/08/2015
// Design Name:   clkdiv
// Module Name:   /home/alex/verilog/serialtest/test_clk.v
// Project Name:  serialtest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clkdiv
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_clk;

	// Inputs
	reg fast_clk;
	reg rst;

	// Outputs
	wire slow_clk;

	// Instantiate the Unit Under Test (UUT)
	clkdiv uut (
		.fast_clk(fast_clk), 
		.rst(rst), 
		.slow_clk(slow_clk)
	);

	initial begin
		// Initialize Inputs
		fast_clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
        
		// Add stimulus here

	end
      
     always begin
     	#25 fast_clk = ~fast_clk;
     end
endmodule

