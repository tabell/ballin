`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:18 04/08/2015
// Design Name:   main
// Module Name:   /home/alex/verilog/misc/uart/main_tb.v
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
	reg rst;
	reg usb_rs232_rxd;
	reg send_trigger;
	reg [7:0] send_data;

	// Outputs
	wire usb_rs232_txd;
	wire gpio_led1;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.rst(rst), 
		.usb_rs232_rxd(usb_rs232_rxd), 
		.send_trigger(send_trigger), 
		.send_data(send_data), 
		.usb_rs232_txd(usb_rs232_txd), 
		.gpio_led1(gpio_led1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		usb_rs232_rxd = 0;
		send_trigger = 0;

		// Wait 100 ns for global reset to finish
		usb_rs232_rxd <= 0'bZ;
		#110;
		send_trigger <= 1;
		send_data <= "Q";
		#20 send_trigger <= 0;
		 send_data <= "A"; send_trigger <= 1; #800 send_trigger <= 0; #900;
		 send_data <= "L"; send_trigger <= 1; #800 send_trigger <= 0; #900;
		 send_data <= "E"; send_trigger <= 1; #800 send_trigger <= 0; #900;
		 send_data <= "X"; send_trigger <= 1; #800 send_trigger <= 0; #900;
        
		// Add stimulus here

	end
	always 
		#10 clk <= ~clk;
      
endmodule

