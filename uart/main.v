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
  input send_trigger,
  input [7:0] send_data,
  output usb_rs232_txd,
  output gpio_led1
);
   // internal
  reg [8:0] buffer = 0;
  wire user_clock;
  reg sending = 0;
  reg ready_sending = 0;

   // outputs
  reg usb_rs232_txd = 1;
  reg gpio_led1 = 0;

   // inputs
  wire rst;
  wire usb_rs232_rxd;
  wire send_trigger;
  wire [7:0] send_data;

  reg [24:0] led_flash_gen;
  reg [5:0] baud_gen = 0; // this will count to 43 to trigger uart_enable
  reg [5:0] char_gen = 0; // this will count from 0 to 7 to count baud pulses for each character
  reg uart_enable = 0; // this will go high once per UART baud pulse
  reg sending = 0;

  reg [7:0] test_char = "G";
  
  always begin
    usb_rs232_txd <= usb_rs232_rxd;

    if (baud_gen == 43)
      if (sending) begin
        uart_enable <= 1;
        baud_gen <= 0;
      end if
    else begin
      baud_gen <= baud_gen + 1;
      uart_enable <= 0;
    end

    if (char_gen == 7)
    begin
      char_gen <= 0;
    end
    else
    begin
      char_gen <= char_gen + 1;
    end


    if(uart_enable) begin

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

