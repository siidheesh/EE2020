`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2017 19:31:22
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module triangle(input clksamp, input signed[33:0] freq, input signed[33:0] amp, input signed[33:0] off, input signed[33:0] duty, output[11:0] dac);
parameter SAMP_FREQ = 100_000_000;

reg signed[33:0] level = 0;
reg state = 1'b0;
wire signed[33:0] clipped_duty = duty < 15 ? 15 : duty > 989 ? 999 : duty;
wire signed[33:0] delta = (2 * freq * 262144) / SAMP_FREQ;
wire signed[33:0] delta_div = delta * 1000;
wire signed[33:0] delta_up = delta_div / {clipped_duty[33:1],1'b1};
wire signed[33:0] delta_down = delta_div / (1000 - {clipped_duty[33:1],1'b1});

always @(posedge clksamp) begin
    level = state ? ((level - delta_down) < -262144 ? -262144 : level - delta_down) : ((level + delta_up) > 262144 ? 262144 : level + delta_up);
    state = state ? level - delta_down <= -262144 ? 0 : state : level + delta_up >= 262144 ? 1 : state;
end

wire signed[33:0] preclip = off + (level*amp)/262144;

assign dac = preclip < 0 ? 0 : preclip > 4095 ? 4095 : preclip;

endmodule