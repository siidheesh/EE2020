`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2017 10:36:26
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

module var_clock(input clkin, output reg clkout = 0);
parameter load = 32'd2;
reg[31:0] count =  0;

always @(posedge clkin) begin
    count <= (count == 0) ? load - 1 : count - 1;
    clkout <= (count == 0) ? ~clkout : clkout;
end
endmodule