`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:58 06/23/2015 
// Design Name: 
// Module Name:    mult 
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
module mult(
    input [31:0] data_multiplicand,
    input [31:0] data_multiplier,
    output [63:0] data_result,
    input ctrl_enable,
    output ctrl_done,
    input rst,
    input clk
    );

	reg [31:0] a;
	reg [31:0] b;

	reg [1:0] state;

	reg ctrl_done;
	reg [63:0] data_result;


always @(posedge clk) begin : proc_mult
	if (rst == 1) begin
		state <= 0;
		ctrl_done <= 0;
	end else begin
		if(ctrl_enable) begin 
			if (state == 0) begin
				// sample inputs on trigger
				a <= data_multiplicand;
				b <= data_multiplier;
				state <= 1;
			end
			if(state == 1) begin
				data_result <= {a,b};
				ctrl_done <= 1;
				state <= 0;
			end
		end
	end
end


endmodule
