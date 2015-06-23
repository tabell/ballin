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
    input clk
    );

	integer [31:0] a;
	integer [31:0] b;
	integer [31:0] result;

	reg [1:0] state := 0;

always @(posedge clk) begin : proc_mult
	if(ctrl_enable) begin 
		if (state == 0) begin
			// sample inputs on trigger
			a <= data_multiplicand;
			b <= data_multiplier;
			state <= 1;
		end
		elsif(state == 1) begin
			result <= {a & b};
			done <= 1;
		end
	end
end


endmodule
