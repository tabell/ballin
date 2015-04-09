`timescale 1ns / 1ps

module clkdiv(
    input fast_clk,
    input rst,
    output slow_clk
    );
	wire fast_clk;
	reg slow_clk;
	reg [25:0] counter;

	always @(posedge fast_clk) begin : proc_counter
		if(rst) begin
			counter <= 0;
			slow_clk <= 0;
		end else begin
			if (counter == 10000000) // 40mhz / 5,000,000 = 8 hz
			begin
				slow_clk <= ~slow_clk;
				counter <= 0;
			end else
				counter <= counter+1;
		end
	end



endmodule
