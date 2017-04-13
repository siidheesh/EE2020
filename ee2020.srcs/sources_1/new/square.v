`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2017 18:31:22
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


module square(input clksamp, 
            input[31:0] freq, 
            input signed[16:0] amp, 
            input signed[16:0] offset, 
            input[9:0] duty,
            output[11:0] sq);
parameter SAMP_FREQ = 100_000_000;

reg state = 1'b0;
reg[15:0] period_counter = 16'b0;
reg[15:0] duty_counter = 16'b0;

wire[15:0] period_load = (SAMP_FREQ/freq);
wire[15:0] duty_load = (period_load * duty) / 1000;

reg[15:0] period_load_reg = 32'b0;
reg[15:0] duty_load_reg = 32'b0;

always @(posedge clksamp) begin
    period_load_reg <= period_load;
    duty_load_reg <= duty_load;
    period_counter <= (period_load_reg != period_load) ? period_load_reg - 1 : (period_counter > 0) ? period_counter - 1 : period_load_reg - 1;
    duty_counter <= (duty_load_reg != duty_load) ? duty_load_reg - 1 : (duty_counter > 0) ? duty_counter - 1 : (period_counter > 0) ? 0 : duty_load_reg - 1;
    state <= (duty_counter == 0 && period_counter > 0) ? 0 : 1;
end

wire signed[16:0] preclip = state ? offset + amp : offset - amp;

assign sq = (freq == 0 || amp == 0) ? offset > 4095 ? 4095 : offset : duty == 0 ? 0 : preclip > 4095 ? 4095 : preclip < 0 ? 0 : preclip;

endmodule