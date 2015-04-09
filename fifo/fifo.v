`timescale 1ns / 1ps

module fifo (
	input clk,    // Clock
	input clk_en, // Clock Enable
	input rst,  // Asynchronous reset active low
	input [31:0] write_data,
	input write_request,
	input read_request,
	output [31:0] read_data,
	output empty,
	output full
);

// outputs
reg [31:0] read_data;
reg empty;
reg full;
// internal
reg [9:0] head_pointer;
reg [9:0] tail_pointer;
reg [10:0] count;
reg [31:0] stored[0:1023];

integer i;

always @(posedge clk) begin : proc_fifo
	if(rst) begin
		head_pointer <= 0;
		tail_pointer <= 0;
		read_data <= 0;
		empty <= 0;
		full <= 0;
		count <= 0;
		for (i = 0; i < 1024; i=i+1)
			stored[i] <= 0;
	end else if(clk_en) begin
		if(write_request) begin 
			if(full == 0) begin 
				stored[head_pointer] <= write_data;
				head_pointer <= head_pointer + 1;
				count <= count + 1;
			end
		end
		if (read_request) begin 
			if (empty == 0) begin 
				read_data <= stored[tail_pointer];
				tail_pointer <= tail_pointer + 1;
				count <= count - 1;
			end
			else // not reading
				read_data <= {32{0'bZ}};
		end

	end
end

always @(*) begin : proc_count
	if (count == 0)
		empty <= 1;
	else
		empty <= 0;
	if (count == 1024)
		full <= 1;
	else
		full <= 0;
end

endmodule