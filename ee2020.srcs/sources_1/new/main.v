`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.1017 9:36:26
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

module myDAC(
    input clk,
    inout PS2Clk,
    inout PS2Data,
    input[15:0] sw,
    output[7:0] JA,
    output reg[3:0] vgaRed,
    output reg[3:0] vgaGreen,
    output reg[3:0] vgaBlue,
    output reg Vsync,
    output reg Hsync,
    input RsRx,
    input btnC,
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    output[15:0] led, 
    output[6:0] seg, 
    output[3:0] an,
    output dp
    );
localparam MAXVOLTAGE = 3300;
localparam MAXCHAN = 3;
localparam MAXAMP = 4095;
localparam MAXFREQ = 250000;
localparam MAXDUTY = 999;

wire clksamp;
reg clk50 = 0;
wire clkvga = clk50;
reg clk25 = 0;
wire clkdeb;
wire clkseg;

var_clock #(32'd100) vcsamp(clk, clksamp);
var_clock #(32'd1000000) vcdeb(clk, clkdeb);
var_clock #(32'h20000) vcseg(clk, clkseg);
always @(posedge clk) clk50 = ~clk50;
always @(posedge clk50) clk25 = ~clk25;

wire btnu,btnd,btnl,btnr,btnc;
debounce dbu(clkdeb, btnU, btnu);
debounce dbd(clkdeb, btnD, btnd);
debounce dbl(clkdeb, btnL, btnl);
debounce dbr(clkdeb, btnR, btnr);
debounce dbc(clkdeb, btnC, btnc);

wire[10:0] mx;
wire[10:0] my;
wire left_button;
wire right_button;
wire middle_button;

MouseCtl ms(.clk(clk), .rst(1'b0), .xpos(mx), .ypos(my), .left(left_button), .middle(middle_button), .right(right_button), .value(12'b0), .setx(0), .sety(0), .setmax_x(0), .setmax_y(0), .ps2_clk(PS2Clk), .ps2_data(PS2Data));

wire vgactive;
wire hs, vs;
wire [10:0] hc;
wire [10:0] vc;

vga_ctrl vct(clkvga, vgactive, hs, vs, hc, vc);

reg[13:0] step = 1;
reg[17:0] freqa = 1000;
reg[11:0] ampa = 2048;
reg[11:0] offa = 2048;
reg[17:0] freqb = 1000;
reg[11:0] ampb = 2048;
reg[11:0] offb = 2048;
reg[9:0] dutya = 500;
reg[9:0] dutyb = 500;
reg[1:0] chanA = 1;
reg[1:0] chanB = 1;

reg [1:0] lbreg = 0;
reg [1:0] rbreg = 0;
reg [1:0] mbreg = 0;
reg [1:0] btncreg = 0;
reg [1:0] btnureg = 0;
reg [1:0] btndreg = 0;
reg [1:0] btnlreg = 0;
reg [1:0] btnrreg = 0;

localparam btn_y_start = 462;
localparam btn_y_width = 50;
localparam btn_x_start_left = 110;
localparam btn_x_start_right = 460;
localparam btn_x_width = 50;
localparam btn_x_spacing = 10;

wire btn4 = (hc >= btn_x_start_left && hc <= btn_x_start_left+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);
wire btn5 = (hc >= btn_x_start_left+btn_x_width+btn_x_spacing && hc <= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);
wire btn6 = (hc >= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && hc <= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);
wire btn7 = (hc >= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && hc <= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);

wire btn8 = (hc >= btn_x_start_right && hc <= btn_x_start_right+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);
wire btn9 = (hc >= btn_x_start_right+btn_x_width+btn_x_spacing && hc <= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);
wire btn10 = (hc >= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && hc <= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);
wire btn11 = (hc >= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && hc <= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && vc >= btn_y_start && vc <= btn_y_start+btn_y_width);

wire cbtn4 = (mx >= btn_x_start_left && mx <= btn_x_start_left+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);
wire cbtn5 = (mx >= btn_x_start_left+btn_x_width+btn_x_spacing && mx <= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);
wire cbtn6 = (mx >= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && mx <= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);
wire cbtn7 = (mx >= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && mx <= btn_x_start_left+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);

wire cbtn8 = (mx >= btn_x_start_right && mx <= btn_x_start_right+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);
wire cbtn9 = (mx >= btn_x_start_right+btn_x_width+btn_x_spacing && mx <= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);
wire cbtn10 = (mx >= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && mx <= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);
wire cbtn11 = (mx >= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing && mx <= btn_x_start_right+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width+btn_x_spacing+btn_x_width && my >= btn_y_start && my <= btn_y_start+btn_y_width);

wire selected_btna = (chanA == 0) ? btn4 :
                     (chanA == 1) ? btn5 :
                     (chanA == 2) ? btn6 :
                                    btn7;
                                    
wire selected_btnb = (chanB == 0) ? btn8 :
                     (chanB == 1) ? btn9 :
                     (chanB == 2) ? btn10 :
                                    btn11;

wire unselected_btnsa = (chanA == 0) ? btn5 | btn6 | btn7 :
                        (chanA == 1) ? btn4 | btn6 | btn7 :
                        (chanA == 2) ? btn4 | btn5 | btn7 :
                                       btn4 | btn5 | btn6;
                                       
wire unselected_btnsb =  (chanB == 0) ? btn9 | btn10 | btn11 :
                         (chanB == 1) ? btn8 | btn10 | btn11 :
                         (chanB == 2) ? btn8 | btn9  | btn11 :
                                        btn8 | btn9  | btn10;

wire[7:0] text;

wire freq_b;
wire amp_b;
wire off_b;
wire duty_b;
wire freqb_b;
wire ampb_b;
wire offb_b;
wire dutyb_b;

wire combword;
wire combinverse;

text_mod my_text(hc, vc, combword, combinverse);

wire[3:0] fqath,fqahun,fqaten,fqaone;
wire[3:0] apath,apahun,apaten,apaone;
wire[3:0] ofath,ofahun,ofaten,ofaone;
wire[3:0] dyath,dyahun,dyaten,dyaone;
wire[3:0] fqbth,fqbhun,fqbten,fqbone;
wire[3:0] apbth,apbhun,apbten,apbone;
wire[3:0] ofbth,ofbhun,ofbten,ofbone;
wire[3:0] dybth,dybhun,dybten,dybone;

num_to_digits1 nd1(freqa, fqath, fqahun, fqaten, fqaone);
num_to_digits nd2(sw[13]?((ampa*MAXVOLTAGE)/4096):ampa, apath, apahun, apaten, apaone);
num_to_digits nd3(sw[13]?((offa*MAXVOLTAGE)/4096):offa, ofath, ofahun, ofaten, ofaone);
num_to_digits nd4(dutya, dyath, dyahun, dyaten, dyaone);
num_to_digits1 nd5(freqb, fqbth, fqbhun, fqbten, fqbone);
num_to_digits nd6(sw[13]?((ampb*MAXVOLTAGE)/4096):ampb, apbth, apbhun, apbten, apbone);
num_to_digits nd7(sw[13]?((offb*MAXVOLTAGE)/4096):offb, ofbth, ofbhun, ofbten, ofbone);
num_to_digits nd8(dutyb, dybth, dybhun, dybten, dybone);

localparam num_y_width = 30;
localparam num_y_start = 202;
localparam num_y_spacing = 25;
localparam num_x_start_left_4 = 248;
localparam num_x_start_left_6 = 202;
localparam num_x_width = 15;
localparam num_x_start_right = 460;
localparam num_x_spacing = 8;

clickable_num6_left #(num_x_width,num_x_spacing) num0(freqa, fqath, fqahun, fqaten, fqaone, hc, vc, num_x_start_left_6+num_x_spacing, num_y_start, mx, my, text[0], freq_b);
clickable_num4 #(num_x_width,num_x_spacing) num1(ampa, apath, apahun, apaten, apaone, hc, vc, num_x_start_left_4+num_x_spacing, num_y_start+num_y_width+num_y_spacing, mx, my, text[1], amp_b);
clickable_num4 #(num_x_width,num_x_spacing) num2(offa, ofath, ofahun, ofaten, ofaone, hc, vc, num_x_start_left_4+num_x_spacing, num_y_start+num_y_width+num_y_spacing+num_y_width+num_y_spacing, mx, my, text[2], off_b);
clickable_num4 #(num_x_width,num_x_spacing) num3(dutya, dyath, dyahun, dyaten, dyaone,hc, vc, num_x_start_left_4+num_x_spacing, num_y_start+num_y_width+num_y_spacing+num_y_width+num_y_spacing+num_y_width+num_y_spacing, mx, my, text[3], duty_b);

clickable_num6_right #(num_x_width,num_x_spacing) num4(freqb, fqbth, fqbhun, fqbten, fqbone, hc, vc, num_x_start_right, num_y_start, mx, my, text[4], freqb_b);
clickable_num4 #(num_x_width,num_x_spacing) num5(ampb, apbth, apbhun, apbten, apbone, hc, vc, num_x_start_right, num_y_start+num_y_width+num_y_spacing, mx, my, text[5], ampb_b);
clickable_num4 #(num_x_width,num_x_spacing) num6(offb, ofbth, ofbhun, ofbten, ofbone, hc, vc,  num_x_start_right, num_y_start+num_y_width+num_y_spacing+num_y_width+num_y_spacing, mx, my, text[6], offb_b);
clickable_num4 #(num_x_width,num_x_spacing) num7(dutyb, dybth, dybhun, dybten, dybone, hc, vc, num_x_start_right-num_x_width-num_x_spacing, num_y_start+num_y_width+num_y_spacing+num_y_width+num_y_spacing+num_y_width+num_y_spacing, mx, my, text[7], dutyb_b);

wire combtext = combinverse|(|text);

wire[3:0] s1 = ~sw[0] ? sw[1] ? fqath :
					  sw[2] ? apath :
					  sw[3] ? ofath :
					  sw[4] ? dyath : 2 
				    : sw[1] ? fqbth :
					  sw[2] ? apbth :
					  sw[3] ? ofbth :
					  sw[4] ? dybth : 2;
					  
wire[3:0] s2 = ~sw[0] ? sw[1] ? fqahun :
					  sw[2] ? apahun :
					  sw[3] ? ofahun :
					  sw[4] ? dyahun : 0 
				    : sw[1] ? fqbhun :
					  sw[2] ? apbhun :
					  sw[3] ? ofbhun :
					  sw[4] ? dybhun : 0;
					  
wire[3:0] s3 = ~sw[0] ? sw[1] ? fqaten :
					  sw[2] ? apaten :
					  sw[3] ? ofaten :
					  sw[4] ? dyaten : 2 
				    : sw[1] ? fqbten :
					  sw[2] ? apbten :
					  sw[3] ? ofbten :
					  sw[4] ? dybten : 2;
					  
wire[3:0] s4 = ~sw[0] ? sw[1] ? fqaone :
					  sw[2] ? apaone :
					  sw[3] ? ofaone :
					  sw[4] ? dyaone : 0 
				    : sw[1] ? fqbone :
					  sw[2] ? apbone :
					  sw[3] ? ofbone :
					  sw[4] ? dybone : 0;

seg_disp segd(clkseg, s1, s2, s3, s4, 1'b0, seg, an, dp);

assign led[3] = sw[0] ? (chanB == 0) : (chanA == 0);
assign led[2] = sw[0] ? (chanB == 1) : (chanA == 1);
assign led[1] = sw[0] ? (chanB == 2) : (chanA == 2);
assign led[0] = sw[0] ? (chanB == 3) : (chanA == 3);

assign led[15] = step==1;
assign led[14] = step==10;
assign led[13] = step==100;
assign led[12] = step==1000;
assign led[11] = step==10000;

wire[17:0] resetfreq = sw[14]?0:1000;

always @(posedge clk) begin
    lbreg <= {lbreg[0], left_button};
    rbreg <= {rbreg[0], right_button};
    mbreg <= {mbreg[0], middle_button};
    btncreg <= {btncreg[0], btnc};
    btnureg <= {btnureg[0], btnu};
    btndreg <= {btndreg[0], btnd};
    btnlreg <= {btnlreg[0], btnl};
    btnrreg <= {btnrreg[0], btnr};
    if(lbreg==2'b01) begin
        chanA <= (cbtn4) ? 0 :
                 (cbtn5) ? 1 :
                 (cbtn6) ? 2 :
                 (cbtn7) ? 3 : chanA;
		chanB <= (cbtn8) ? 0 :
                 (cbtn9) ? 1 :
                 (cbtn10) ? 2 :
                 (cbtn11) ? 3 : chanB;
        freqa <= (freq_b && freqa <= MAXFREQ-step) ? freqa + step : freqa;
        ampa <=  (amp_b && ampa <= MAXAMP-step) ? ampa + step : ampa;
        offa <=  (off_b && offa <= MAXAMP-step) ? offa + step : offa;  
        dutya <= (duty_b && dutya <= MAXDUTY-step) ? dutya + step : dutya;
        freqb <= (freqb_b && freqb <= MAXFREQ-step) ? freqb + step : freqb;
        ampb <=  (ampb_b && ampb <= MAXAMP-step) ? ampb + step : ampb;
        offb <=  (offb_b && offb <= MAXAMP-step) ? offb + step : offb;  
        dutyb <= (dutyb_b && dutyb <= MAXDUTY-step) ? dutyb + step : dutyb;
    end else if(rbreg==2'b01) begin
        freqa <= (freq_b && freqa >= step) ? freqa - step : freqa;
		ampa <=  (amp_b && ampa >= step) ? ampa - step : ampa;
		offa <=  (off_b && offa >= step) ? offa - step : offa;  
		dutya <= (duty_b && dutya >= step) ? dutya - step : dutya;
		freqb <= (freqb_b && freqb >= step) ? freqb - step : freqb;
		ampb <=  (ampb_b && ampb >= step) ? ampb - step : ampb;
		offb <=  (offb_b && offb >= step) ? offb - step : offb;  
		dutyb <= (dutyb_b && dutyb >= step) ? dutyb - step : dutyb;
    end else if(mbreg==2'b01) begin
        case(step)
        1:step<=10;
        10:step<=100;
        100:step<=1000;
        1000:step<=10000;
        10000:step<=1;
        default:step<=1;
        endcase
    end else if(btncreg==2'b01) begin
        chanA <= 1;
        chanB <= 1;
        freqa <= resetfreq;
        ampa <= 2048;
        offa <= 2048;
        dutya <= 500;
        freqb <= resetfreq;
        ampb <=  2048;
        offb <=  2048;
        dutyb <= 500;
        step <= 1;
    end else if(btnureg==2'b01) begin
		freqa <= (sw[4:0]==2 && freqa <= MAXFREQ-step) ? freqa + step : freqa;
        ampa <=  (sw[4:0]==4 && ampa <= MAXAMP-step) ? ampa + step : ampa;
        offa <=  (sw[4:0]==8 && offa <= MAXAMP-step) ? offa + step : offa;
        dutya <= (sw[4:0]==16 && dutya <= MAXDUTY-step) ? dutya + step : dutya;
        freqb <= (sw[4:0]==3 && freqb <= MAXFREQ-step) ? freqb + step : freqb;
        ampb <=  (sw[4:0]==5 && ampb <= MAXAMP-step) ? ampb + step : ampb;
        offb <=  (sw[4:0]==9 && offb <= MAXAMP-step) ? offb + step : offb;
        dutyb <= (sw[4:0]==17 && dutyb <= MAXDUTY-step) ? dutyb + step : dutyb;
	end else if(btndreg==2'b01) begin
		freqa <= (sw[4:0]==2 && freqa >= step) ? freqa - step : freqa;
		ampa <=  (sw[4:0]==4 && ampa >= step) ? ampa - step : ampa;
		offa <=  (sw[4:0]==8 && offa >= step) ? offa - step : offa;
		dutya <= (sw[4:0]==16 && dutya >= step) ? dutya - step : dutya;
		freqb <= (sw[4:0]==3 && freqb >= step) ? freqb - step : freqb;
		ampb <=  (sw[4:0]==5 && ampb >= step) ? ampb - step : ampb;
		offb <=  (sw[4:0]==9 && offb >= step) ? offb - step : offb;
		dutyb <= (sw[4:0]==17 && dutyb >= step) ? dutyb - step : dutyb;
	end else if(btnlreg==2'b01) begin
		chanA <= ~sw[15] && ~sw[0] && chanA > 0 ?  chanA - 1 : chanA;
        chanB <= ~sw[15] && sw[0] && chanB > 0 ? chanB - 1 : chanB;
        step <= sw[15] ? step==10000?1000:step==1000?100:step==100?10:1 : step;
	end else if(btnrreg==2'b01) begin
		chanA <= ~sw[15] && ~sw[0] && chanA < MAXCHAN ? chanA + 1 : chanA;
        chanB <= ~sw[15] && sw[0] && chanB < MAXCHAN ? chanB + 1 : chanB;
        step <= sw[15] ? step==1?10:step==10?100:step==100?1000:10000 : step;
	end
end

wire[11:0] arbA, arbB;
arb arbmod(clk25, RsRx, arbA, arbB);

wire[11:0] sinA, sinB;
sinemod mysineA(clksamp, freqa, ampa, offa, sinA);
sinemod mysineB(clksamp, freqb, ampb, offb, sinB);

wire[11:0] sqA, sqB;
square #(500_000) sqmodA(clksamp, freqa, ampa, offa, dutya, sqA);
square #(500_000) sqmodB(clksamp, freqb, ampb, offb, dutyb, sqB);

wire[11:0] triA, triB;
triangle #(500_000) trimodA(clksamp, freqa, ampa, offa, dutya, triA);
triangle #(500_000) trimodB(clksamp, freqb, ampb, offb, dutyb, triB);

wire[11:0] DATA_A = (chanA == 0) ? arbA :
                    (chanA == 1) ? sinA :
                    (chanA == 2) ? sqA : triA;
wire[11:0] DATA_B = (chanB == 0) ? arbB :
                    (chanB == 1) ? sinB :
                    (chanB == 2) ? sqB : triB;

DA2RefComp dac(.CLK(clk50), .D1(JA[1]), .D2(JA[2]), .CLK_OUT(JA[3]), .nSYNC(JA[0]), .DATA1(DATA_A), .DATA2(DATA_B), .START(clksamp));

wire mouse_inner;
wire mouse_outline;

region_mouse_white rmw(hc, vc, mx, my, mouse_inner);
region_mouse_black rmb(hc, vc, mx, my, mouse_outline);

wire vgawhite = unselected_btnsa | unselected_btnsb | combtext;
wire vgared = vgawhite;
wire vgagreen = vgawhite | selected_btna | selected_btnb;
wire vgablu = vgawhite | selected_btna | selected_btnb;
wire vgablack = mouse_outline | combword;

always@(posedge clkvga) begin      
    vgaRed <= {4{vgactive & ((vgared & ~vgablack) | mouse_inner)}};
    vgaGreen <= {4{vgactive & ((vgagreen & ~vgablack) | mouse_inner)}};
    vgaBlue <= {4{vgactive & ((vgablu & ~vgablack) | mouse_inner)}};
    Hsync <= hs;
    Vsync <= vs;
end

endmodule

module text_mod(input[10:0] hc, input[10:0] vc, output text_out1, output text_out2);
localparam sp = 10;
localparam header_x = 320;
localparam header_y = 96;
localparam freq_x = 380;
localparam freq_y = 212;
localparam amp_x = 385;
localparam amp_y = 267;
localparam offset_x = 370;
localparam offset_y = 322;
localparam duty_x = 380;
localparam duty_y = 377;

localparam btn_y = 462+20;
localparam arba_x = 110+10;
localparam arbb_x = 460+10;
localparam sina_x = 170+5;
localparam sinb_x = 520+5;
localparam sqa_x = 230+15;
localparam sqb_x = 580+15;
localparam tria_x = 290+10;
localparam trib_x = 640+10;
localparam cha_x = 290;
localparam cha_y = 96;
localparam chb_x = 490;
localparam chb_y = 96;

wire[3:0] wordcha;
alphanum #("C") acha1(hc, vc, cha_x, cha_y, wordcha[0]);
alphanum #("h") acha2(hc, vc, cha_x+sp, cha_y+1, wordcha[1]);
alphanum #("A") acha3(hc, vc, cha_x+sp+sp+sp, cha_y, wordcha[2]);

wire[3:0] wordchb;
alphanum #("C") achb1(hc, vc, chb_x, chb_y, wordchb[0]);
alphanum #("h") achb2(hc, vc, chb_x+sp, chb_y+1, wordchb[1]);
alphanum #("B") achb3(hc, vc, chb_x+sp+sp+sp, chb_y, wordchb[2]);

wire[3:0] wordarb1;
alphanum #("A") aarb1(hc, vc, arba_x, btn_y, wordarb1[0]);
alphanum #("r") aarb2(hc, vc, arba_x+sp, btn_y+1, wordarb1[1]);
alphanum #("b") aarb3(hc, vc, arba_x+sp+sp, btn_y+1, wordarb1[2]);

wire[3:0] wordarb2;
alphanum #("A") aarb4(hc, vc, arbb_x, btn_y, wordarb2[0]);
alphanum #("r") aarb5(hc, vc, arbb_x+sp, btn_y+1, wordarb2[1]);
alphanum #("b") aarb6(hc, vc, arbb_x+sp+sp, btn_y+1, wordarb2[2]);

wire[3:0] wordsin1;
alphanum #("S") asine1(hc, vc, sina_x, btn_y, wordsin1[0]);
alphanum #("i") asine2(hc, vc, sina_x+sp, btn_y+1, wordsin1[1]);
alphanum #("n") asine3(hc, vc, sina_x+sp+sp, btn_y+1, wordsin1[2]);
alphanum #("e") asine4(hc, vc, sina_x+sp+sp+sp, btn_y+1, wordsin1[3]);

wire[3:0] wordsin2;
alphanum #("S") asine5(hc, vc, sinb_x, btn_y, wordsin2[0]);
alphanum #("i") asine6(hc, vc, sinb_x+sp, btn_y+1, wordsin2[1]);
alphanum #("n") asine7(hc, vc, sinb_x+sp+sp, btn_y+1, wordsin2[2]);
alphanum #("e") asine8(hc, vc, sinb_x+sp+sp+sp, btn_y+1, wordsin2[3]);

wire[1:0] wordsq1;
alphanum #("S") asq1(hc, vc, sqa_x, btn_y, wordsq1[0]);
alphanum #("q") aqs2(hc, vc, sqa_x+sp, btn_y+1, wordsq1[1]);

wire[1:0] wordsq2;
alphanum #("S") asq3(hc, vc, sqb_x, btn_y, wordsq2[0]);
alphanum #("q") asq4(hc, vc, sqb_x+sp, btn_y+1, wordsq2[1]);

wire[2:0] wordtri1;
alphanum #("T") atri1(hc, vc, tria_x, btn_y, wordtri1[0]);
alphanum #("r") atri2(hc, vc, tria_x+sp, btn_y+1, wordtri1[1]);
alphanum #("i") atri3(hc, vc, tria_x+sp+sp, btn_y+1, wordtri1[2]);

wire[2:0] wordtri2;
alphanum #("T") atri4(hc, vc, trib_x, btn_y, wordtri2[0]);
alphanum #("r") atri5(hc, vc, trib_x+sp, btn_y+1, wordtri2[1]);
alphanum #("i") atri6(hc, vc, trib_x+sp+sp, btn_y+1, wordtri2[2]);

wire[3:0] wordsfreqa;
alphanum #("F") afreq1(hc, vc, freq_x, freq_y, wordsfreqa[0]);
alphanum #("r") afreq2(hc, vc, freq_x+sp, freq_y+1, wordsfreqa[1]);
alphanum #("e") afreq3(hc, vc, freq_x+sp+sp, freq_y+1, wordsfreqa[2]);
alphanum #("q") afreq4(hc, vc, freq_x+sp+sp+sp, freq_y+1, wordsfreqa[3]);

wire[2:0] wordampa;
alphanum #("A") aamp1(hc, vc, amp_x, amp_y, wordampa[0]);
alphanum #("m") aamp2(hc, vc, amp_x+sp, amp_y+1, wordampa[1]);
alphanum #("p") aamp3(hc, vc, amp_x+sp+sp, amp_y+1, wordampa[2]);

wire[5:0] wordoffa;
alphanum #("O") aoff1(hc, vc, offset_x, offset_y, wordoffa[0]);
alphanum #("f") aoff2(hc, vc, offset_x+sp, offset_y+1, wordoffa[1]);
alphanum #("f") aoff3(hc, vc, offset_x+sp+sp, offset_y+1, wordoffa[2]);
alphanum #("s") aoff4(hc, vc, offset_x+sp+sp+sp, offset_y+1, wordoffa[3]);
alphanum #("e") aoff5(hc, vc, offset_x+sp+sp+sp+sp, offset_y+1, wordoffa[4]);
alphanum #("t") aoff6(hc, vc, offset_x+sp+sp+sp+sp+sp, offset_y+1, wordoffa[5]);

wire[3:0] worddutya;
alphanum #("D") aduty1(hc, vc, duty_x, duty_y, worddutya[0]);
alphanum #("u") aduty2(hc, vc, duty_x+sp, duty_y+1, worddutya[1]);
alphanum #("t") aduty3(hc, vc, duty_x+sp+sp, duty_y+1, worddutya[2]);
alphanum #("y") aduty4(hc, vc, duty_x+sp+sp+sp, duty_y+1, worddutya[3]);

assign text_out1 = (| wordarb1)|(| wordarb2)|(| wordsin1)|(| wordsin2)|(| wordsq1)|(| wordsq2)|(| wordtri1)|(| wordtri2);
assign text_out2 = (| wordsfreqa)|(| wordampa)|(| wordoffa)|(| worddutya)|(| wordcha)|(| wordchb);
endmodule