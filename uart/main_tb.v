`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:58:43 04/08/1015
// Design Name:   main
// Module Name:   /home/alex/verilog/serialtest/main_tb.v
// Project Name:  serialtest
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
	reg rst;
	reg serial_rx;

	// Outputs
	wire serial_tx;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.rst(rst), 
		.serial_rx(serial_rx), 
		.serial_tx(serial_tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		serial_rx = 0;
		// Wait 100 ns for global reset to finish
		#110;
		rst = 0;

		serial_rx <= 0;
		#20 serial_rx <= 1;
		#20 serial_rx <= 0;
		#20 serial_rx <= 0;
		#20 serial_rx <= 1;
		#20 serial_rx <= 0;
		#20 serial_rx <= 0;
		#20 serial_rx <= 0;
		#20 serial_rx <= 1;
		#20 serial_rx <= 0;
		#20 serial_rx <= 0;
		#20 serial_rx <= 0;
		#20 serial_rx <= 0;
		#20 serial_rx <= 1;
		#20 serial_rx <= 0;

        
		// Add stimulus here

	end
 	always begin
		#10	clk <= ~clk;
	end     
endmodule

