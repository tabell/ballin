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
    input USER_CLOCK,
    input rst,
    input USB_RS232_RXD,
    output USB_RS232_TXD,
	output GPIO_LED1,
	output GPIO_LED2,
	output GPIO_LED3,
	output GPIO_LED4
    );
	// internal
	reg [8:0] buffer;
	wire USER_CLOCK;

	// outputs
	reg USB_RS232_TXD = 0;
	reg GPIO_LED1 = 0;
	reg GPIO_LED2 = 0;
	reg GPIO_LED3 = 0;
	reg GPIO_LED4 = 0;

	// inputs
	wire rst;
	wire USB_RS232_RXD;

	reg [25:0] counter;
	reg [5:0] counter_baud; // count to 43
	reg [2:0] counter_symbol; // count to 43

	always @(posedge USER_CLOCK) begin : proc_USB_RS232_TXD
		if(rst) begin
			// USB_RS232_TXD <= 0;
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
				USB_RS232_TXD <= USB_RS232_RXD;
			end
			else
				counter_baud <= counter_baud + 1;
			// ---------------------------------------------------------------
			if (counter == 10000000) // divide clock from 40mhz to 4 hz for flashing LEDs
			begin
				counter <= 0;
				GPIO_LED1 <= ~GPIO_LED1;
				GPIO_LED2 <= ~GPIO_LED2;
			end
			else
				counter <= counter+1;
		end
	end
endmodule
