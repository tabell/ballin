`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:06 04/08/2015 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(
    input clk,
    input rst,
    input serial_rx,
    output serial_tx,
    output [3:0] led
    );
	// internal
	reg [8:0] buffer;
	wire clk;

	// outputs
	reg serial_tx = 0;
	reg [3:0] led = 4'b0100;

	// inputs
	wire rst;
	wire serial_rx;

	reg [25:0] counter;
	reg [5:0] counter_baud; // count to 43
	reg [2:0] counter_symbol; // count to 43

	always @(posedge clk) begin : proc_serial_tx
		if(rst) begin
			// serial_tx <= 0;
			// buffer <= 0;
			counter <= 0;
			counter_baud <= 0;
			buffer <= 0;
		end 
		else 
		begin
			if (counter_baud == 43) // divide clock from 40mhz to 8*115200 bps
			begin
				counter_baud <= 0;
				serial_tx <= serial_rx;
			end
			else
				counter_baud <= counter_baud + 1;
			// ---------------------------------------------------------------
			if (counter == 10000000) // divide clock from 40mhz to 4 hz for flashing LEDs
			begin
				counter <= 0;
				led[0] <= ~led[0];
				led[1] <= ~led[1];
			end
			else
				counter <= counter+1;
		end
	end
endmodule
