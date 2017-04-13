`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2017 01:26:40
// Design Name: 
// Module Name: seg_disp
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


module seg_disp(
    input clk,
    input[7:0] d1,
    input[7:0] d2,
    input[7:0] d3,
    input[7:0] d4,
    input dp,
    output reg[6:0] seg,
    output reg[3:0] an,
    output dp_pin
    );

wire[6:0] seg1;
wire[6:0] seg2;
wire[6:0] seg3;                  
wire[6:0] seg4;

reg[2:0] state = 0;

assign dp_pin = 1;

number_to_seg dd1(d1, seg1);
number_to_seg dd2(d2, seg2);
number_to_seg dd3(d3, seg3);
number_to_seg dd4(d4, seg4);

wire nd1 = (d1 == 0);
wire nd2 = (d2 == 0);
wire nd3 = (d3 == 0);

always @(posedge clk) begin
    case (state)
        default: state <= 0;
        0: begin
            seg <= seg1;
            an <= nd1 ? 4'b1111 : 4'b0111;
            state <= state + 1;
           end
        1: begin
            seg <= seg2;
            an <= nd1 && nd2 ? 4'b1111 : 4'b1011;
            state <= state + 1;
           end
        2: begin
            seg <= seg3;
            an <= nd1 && nd2 && nd3 ? 4'b1111 : 4'b1101;
            state <= state + 1;
           end
        3: begin
            seg <= seg4;
            an <= 4'b1110;
            state <= 0;
           end
        endcase
end
endmodule

module number_to_seg(input[7:0] d, output[6:0] seg);
    assign seg = (d == 0) ? 7'b1000000 : 
                 (d == 1) ? 7'b1111001 :
                 (d == 2) ? 7'b0100100 :
                 (d == 3) ? 7'b0110000 :
                 (d == 4) ? 7'b0011001 :
                 (d == 5) ? 7'b0010010 : 
                 (d == 6) ? 7'b0000010 :
                 (d == 7) ? 7'b1111000 :
                 (d == 8) ? 7'b0000000 :
                 (d == 9) ? 7'b0010000 : 7'b1000000;
endmodule

module num_to_digits(input[11:0] _num, output[3:0] _thousands, output [3:0] _hundreds, output [3:0] _tens, output [3:0] _ones);
    assign _thousands = (_num % 10000) / 1000;
    assign _hundreds = (_num % 1000) / 100;
    assign _tens = (_num % 100) / 10;
    assign _ones = _num % 10;
endmodule

module num_to_digits1(input[17:0] _num, output[3:0] _thousands, output [3:0] _hundreds, output [3:0] _tens, output [3:0] _ones);
    assign _thousands = (_num % 10000) / 1000;
    assign _hundreds = (_num % 1000) / 100;
    assign _tens = (_num % 100) / 10;
    assign _ones = _num % 10;
endmodule