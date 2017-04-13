`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2017 13:00:32
// Design Name: 
// Module Name: arb
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

module arb(
    input clk25,
    input uartrx,
    output[11:0] outA,
    output[11:0] outB
    );

reg[63:0] freqA = 1000;
reg[63:0] freqB = 1000;

wire rxready;
wire[7:0] recv_data;
wire rxidle;

async_receiver uart(clk25, uartrx, rxready, recv_data, rxidle);

reg chan = 1;
reg[15:0] write_i = 0;
reg[7:0] msb = 0;
reg[1:0] rxstate = 0;

reg[31:0] phase_accA = 0;
reg[31:0] phase_accB = 0;

reg[15:0] writedata = 0;
reg writeen = 0;
reg[13:0] options = 0;

reg burst_modeA = 0;
reg burstA = 0;
reg burst_modeB = 0;
reg burstB = 0;

wire frame_ch1 = (msb[7:6] == 1);
wire frame_ch2 = (msb[7:6] == 2);
wire frame_opt = (msb[7:6] == 3);
wire[13:0] header_payload = {msb[5:0],recv_data};
wire[15:0] phaseoutA = phase_accA[31:16];
wire[15:0] phaseoutB = phase_accB[31:16];

always @(posedge clk25) begin
    if(rxready) begin        
        msb <= recv_data;
        rxstate = (rxstate==0)?1:(rxstate==1)?2:1;
        if(rxstate == 2) begin
            writedata <= {msb, recv_data};
            writeen = !(frame_ch1 || frame_ch2);
            freqA = frame_ch1 ? header_payload : freqA;
            freqB = frame_ch2 ? header_payload : freqB;
            options = frame_opt ? header_payload : options;
            write_i = (writedata[15:14] != 0) ? 0 : write_i + 1;
            chan = (frame_ch1) ? 0 : (frame_ch2) ? 1 : chan;
        end else begin
            options = 0;
            writeen = 0;
        end
    end else begin
        options = 0;
        if(rxidle)
            rxstate = 0;
    end
    burst_modeA = burst_modeA ? (options[1]==0) : (options[0]==1);
    burstA <= burstA ? (phaseoutA < 65535) : (options[2]);
    phase_accA = (burst_modeA && !burstA) ? 0 : phase_accA + ((freqA*1717987)/10000);
    burst_modeB = burst_modeB ? (options[4]==0) : (options[3]==1);
    burstB <= burstB ? (phaseoutB < 65535) : (options[5]);
    phase_accB = (burst_modeB && !burstB) ? 0 : phase_accB + ((freqB*1717987)/10000);
end

blk_mem_gen_arb ddsram1(.clka(clk25), .ena(~chan), .wea(writeen), .addra(write_i), .dina(writedata[11:0]), .clkb(clk25), .enb(1'b1), .addrb(phaseoutA), .doutb(outA));
blk_mem_gen_arb ddsram2(.clka(clk25), .ena(chan), .wea(writeen), .addra(write_i), .dina(writedata[11:0]), .clkb(clk25), .enb(1'b1), .addrb(phaseoutB), .doutb(outB));

endmodule