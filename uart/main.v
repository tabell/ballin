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

   // outputs
  reg usb_rs232_txd = 0;
  reg gpio_led1 = 0;

   // inputs
  wire rst;
  wire usb_rs232_rxd;
  wire send_trigger;
  wire [7:0] send_data;

  reg [25:0] counter = 0;
  reg [5:0] counter_baud = 0; // count to 43
  reg [2:0] counter_symbol = 0; // count to 7

  reg [7:0] data_counter = 0;
  reg [2:0] state = 0;

  reg [7:0] temp_data = 90; // palindromic binary

  always @(posedge user_clock) begin : proc_usb_rs232_txd
    if (counter_baud == 247) // divide clock from 40mhz to 8*115200 bps
      begin
        case (state) // only initiate a send in idle
          0 : begin
            if (send_trigger)
              begin
                state <= 1; // start bit state
                temp_data <= send_data;
              end
          end
        1 : begin
          usb_rs232_txd <= 0; // send start bit
          data_counter <= 1;
          counter_symbol <= 0;
          state <= 2;
        end
        2 : begin 
            counter_symbol <= counter_symbol + 1;
          if (counter_symbol == 7)
            begin
              data_counter <= data_counter << 1;
              temp_data <= temp_data << 1;
              if (data_counter == 0)
                begin
                  state <= 3;
                  usb_rs232_txd <= 1;
                  counter_symbol <= 0;
                end
              else
                usb_rs232_txd <= temp_data[7];
            end
        end
        3 : begin
          usb_rs232_txd <= 1; // stop bit is high
          counter_symbol <= counter_symbol + 1;
          if (counter_symbol == 7)
            begin
              state <= 0;
              counter_symbol <= 0;
            end
        end

        default : usb_rs232_txd <= 1; // idle is high

      endcase
      counter_baud <= 0;
    end
    else
      counter_baud <= counter_baud + 1;

    if (state == 0 & send_trigger == 0)
      usb_rs232_txd <= usb_rs232_rxd; // echo back for now

      // ---------------------------------------------------------------
    if (counter == 10000000) // divide clock from 40mhz to 4 hz for flashing leds
      begin
        counter <= 0;
        gpio_led1 <= ~gpio_led1;
      end
    else
      counter <= counter+1;


  end
endmodule

