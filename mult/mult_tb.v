`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:02:28 06/23/2015
// Design Name:   mult
// Module Name:   /home/alex/code/misc/mult/mult_tb.v
// Project Name:  mult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mult_tb;

	// Inputs
	reg [31:0] data_multiplicand;
	reg [31:0] data_multiplier;
	reg ctrl_enable;
	reg clk;

	// Outputs
	wire [63:0] data_result;
	wire ctrl_done;

	// Instantiate the Unit Under Test (UUT)
	mult uut (
		.data_multiplicand(data_multiplicand), 
		.data_multiplier(data_multiplier), 
		.data_result(data_result), 
		.ctrl_enable(ctrl_enable), 
		.ctrl_done(ctrl_done), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		data_multiplicand = 0;
		data_multiplier = 0;
		ctrl_enable = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

