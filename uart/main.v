`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// company: 
// engineer: 
// 
// create date:    13:55:06 04/08/2015 
// design name: 
// module name:    main 
// project name: 
// target devices: 
// tool versions: 
// description: 
//
// dependencies: 
//
// revision: 
// revision 0.01 - file created
// additional comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(
    input user_clock,
    input rst,
    input usb_rs232_rxd,
    output usb_rs232_txd,
	output gpio_led1
    );
	// internal
	reg [8:0] buffer;
	wire user_clock;

	// outputs
	reg usb_rs232_txd = 0;
	reg gpio_led1 = 0;

	// inputs
	wire rst;
	wire usb_rs232_rxd;

	reg [25:0] counter;
	reg [5:0] counter_baud; // count to 43
	reg [2:0] counter_symbol; // count to 43

	reg [7:0] data_counter;
	reg [2:0] tx_state;

	always @(posedge user_clock) begin : proc_usb_rs232_txd
		if(rst) begin
			counter <= 0;
			counter_baud <= 0;
			buffer <= 0;
		end 
		else 
		begin
			if (counter_baud == 43) // divide clock from 40mhz to 8*115200 bps
			begin
				counter_baud <= 0;
				usb_rs232_txd <= usb_rs232_rxd; // echo back for now
			end
			else
				counter_baud <= counter_baud + 1;
			// ---------------------------------------------------------------
			if (counter == 10000000) // divide clock from 40mhz to 4 hz for flashing leds
			begin
				counter <= 0;
				gpio_led1 <= ~gpio_led1;
			end
			else
				counter <= counter+1;
		end
	end
endmodule
