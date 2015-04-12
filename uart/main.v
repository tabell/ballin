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
  input clk,
  input rst,
  input usb_rs232_rxd,
  input send_trigger,
  input [7:0] send_data,
  output usb_rs232_txd,
  output gpio_led1
);

   // outputs
  reg usb_rs232_txd = 1;
  reg gpio_led1 = 0;

   // inputs
  wire rst;
  wire usb_rs232_rxd;
  wire send_trigger;
  wire [7:0] send_data;

   // internal
  reg [8:0] buffer = 0;
  wire clk;
  reg ready_sending = 0;

  reg [24:0] led_flash_gen;
  reg [5:0] baud_gen = 0; // this will count to 43 to trigger uart_enable
  reg [5:0] char_gen = 0; // this will count from 0 to 7 to count baud pulses for each character
  reg uart_enable = 0; // this will go high once per UART baud pulse
  reg sending = 0;
  reg [3:0] char = 0;

  reg [7:0] test_char = "G";
  
  always @(posedge clk) begin

    if (baud_gen == 43) begin
      baud_gen <= 0;
    end
    else begin
      baud_gen <= baud_gen + 1;
      uart_enable <= 0;
    end


    if (char_gen == 7) begin
      if (char == 9)
        sending <= 0;
      char_gen <= 0;
      char <= char + 1;
      if (char == 9) 
        char <= 0;
    end
    else
    begin
      if (sending) begin
        char_gen <= char_gen + 1;
      end
    end
    if (sending) begin
      case (char)
        0 : usb_rs232_txd <= 0;
        9 : usb_rs232_txd <= 1;
        default : usb_rs232_txd <= send_data[(7-(char-1))];
      endcase;
    end
    else
      usb_rs232_txd <= usb_rs232_rxd;

    if (send_trigger)
      sending <= 1;

    if(uart_enable) begin // baud rate
      if (sending) begin
        uart_enable <= 1;
      end

    end


      // ---------------------------------------------------------------
    if (led_flash_gen == 10000000) // divide clock from 40mhz to 4 hz for flashing leds
      begin
        led_flash_gen <= 0;
        gpio_led1 <= ~gpio_led1;
      end
    else
      led_flash_gen <= led_flash_gen+1;
  end
endmodule

