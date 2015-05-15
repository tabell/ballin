`timescale 1ns / 1ps

module uart(
  input clk,
  input clk_en,
  input [7:0] q_in,
  input trigger,
  output busy,
  output s_out
);

wire [7:0] q_in;
wire trigger;

reg s_out=1;
reg [7:0] temp_var=0;
reg busy=0;

integer counter=0;

integer d = 0;

always @(posedge clk) begin
  if ($signed(d < 0) )
    d <= $signed(d) + 9;
  else begin
    d <= $signed(d) + 9 - 3125;
  end
end
  

// always @(posedge clk) begin : proc_uart
//   if(clk_en) begin
//     if (trigger == 1)
//     begin
//       if (counter == 0) begin
//         counter <= 1;
//         temp_var <= q_in;
//       end
//     end
//     if (counter > 0) begin
//       if (counter < 11) begin
//         counter <= counter + 1;
//         case (counter)
//           1  : s_out <= 1'b0;
//           10 : s_out <= 1'b1;
//           default : s_out <= temp_var[9-counter];
//         endcase
//         if (counter == 10) counter <= 0;
//       end
//     else
//       s_out <= 1'b1;
//     end
//   end
// end

// always @(*) begin : proc_busy
//   if (counter == 0) busy <= 0;
//   else busy <= 1;
// end

endmodule