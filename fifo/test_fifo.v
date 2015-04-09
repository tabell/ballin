`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:16 04/08/2015
// Design Name:   fifo
// Module Name:   /home/alex/verilog/fifo/test_fifo.v
// Project Name:  fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fifo;

	// Inputs
	reg clk;
	reg clk_en;
	reg rst;
	reg [31:0] write_data;
	reg write_request;
	reg read_request;

	// Outputs
	wire [31:0] read_data;
	wire empty;
	wire full;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk), 
		.clk_en(clk_en), 
		.rst(rst), 
		.write_data(write_data), 
		.write_request(write_request), 
		.read_request(read_request), 
		.read_data(read_data), 
		.empty(empty), 
		.full(full)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clk_en = 1;
		rst = 1;
		write_data = 0;
		write_request = 0;
		read_request = 0;

		// Wait 100 ns for global reset to finish
		#90;
		rst <= 0;
		write_data <= 1; write_request <= 1; #20 write_request <= 0;
		write_data <= 2; write_request <= 1; #20 write_request <= 0;
		write_data <= 3; write_request <= 1; #20 write_request <= 0;
		write_data <= 4; write_request <= 1; #20 write_request <= 0;
		write_data <= 5; write_request <= 1; #20 write_request <= 0;
		write_data <= 6; write_request <= 1; #20 write_request <= 0;
		write_data <= 7; write_request <= 1; #20 write_request <= 0;
		write_data <= 8; write_request <= 1; #20 write_request <= 0;
		write_data <= 9; write_request <= 1; #20 write_request <= 0;
		write_data <= 10; write_request <= 1; #20 write_request <= 0;
		write_data <= 11; write_request <= 1; #20 write_request <= 0;
		write_data <= 12; write_request <= 1; #20 write_request <= 0;
		write_data <= 13; write_request <= 1; #20 write_request <= 0;
		write_data <= 14; write_request <= 1; #20 write_request <= 0;
		write_data <= 15; write_request <= 1; #20 write_request <= 0;
		write_data <= 16; write_request <= 1; #20 write_request <= 0;
		write_data <= 17; write_request <= 1; #20 write_request <= 0;
		write_data <= 18; write_request <= 1; #20 write_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		read_request <= 1; #20 read_request <= 0;
		write_data <= 19; write_request <= 1; #20 write_request <= 0;
		write_data <= 20; write_request <= 1; #20 write_request <= 0;
		write_data <= 21; write_request <= 1; #20 write_request <= 0;
		write_data <= 22; write_request <= 1; #20 write_request <= 0;
		write_data <= 23; write_request <= 1; #20 write_request <= 0;
		write_data <= 24; write_request <= 1; #20 write_request <= 0;
		write_data <= 25; write_request <= 1; #20 write_request <= 0;
		write_data <= 26; write_request <= 1; #20 write_request <= 0;
		read_request <= 1; #360 read_request <= 0;
		#40;
		write_data <= -1; write_request <= 1; #20 write_request <= 0;
		write_data <= -2; write_request <= 1; #20 write_request <= 0;
		write_data <= -3; write_request <= 1; #20 write_request <= 0;

		// Add stimulus here

	end
	always begin 
		#10 clk <= ~clk;
	end
      
endmodule

