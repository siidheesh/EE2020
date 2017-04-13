`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2017 18:36:26
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

//Inspired by https://github.com/tlautrec/EE2020_FPGA_project/blob/master/project.srcs/sources_1/imports/skeleton_sources/vga_ctrl.vhd
module vga_ctrl(
    input clkvga,
    output reg active,
    output reg hs = 0,
    output reg vs = 0,
    output reg[10:0] hc = 0,
    output reg[10:0] vc = 0
    );
    
parameter width = 800;
parameter height = 600;
parameter H_FP = 56;
parameter H_PW = 120;
parameter H_MAX = 1040;
parameter V_FP = 37;
parameter V_PW = 6;
parameter V_MAX = 666;

always @(posedge clkvga) begin
    hc <= (hc == H_MAX - 1) ? 0 : hc + 1;
    if((hc == (H_MAX - 1)) && (vc == (V_MAX - 1)))
        vc <= 0;
    else if(hc == (H_MAX - 1))
        vc <= vc + 1;
    hs <= (hc >= (H_FP + width - 1)) && (hc < (H_FP + width + H_PW - 1)) ? 1 : 0;
    vs <= (vc >= (V_FP + height - 1)) && (vc < (V_FP + height + V_PW - 1)) ? 1 : 0;
    active <= (hc < width && vc < height);
end
endmodule

//Rest created with python script and coe file from https://forums.xilinx.com/t5/Spartan-Family-FPGAs/Character-ROM-generation/m-p/46351#M3721
module alphanum(
    input [10:0] hc,
    input [10:0] vc,
    input [10:0] hs,
    input [10:0] vs,
    output reg yes
    );
    parameter code = 0;
    parameter x_wrap = 0;

    always @ (*) begin
        case (code)
			//A
			8'd65:yes=((hc==hs+1||hc==hs+7)&&(vc>=vs+5&&vc<=vs+11))||((hc==hs+2||hc==hs+6)&&(vc>=vs+4&&vc<=vs+11))||((hc==hs+3||hc==hs+5)&&((vc>=vs+3&&vc<=vs+4)||(vc==vs+8)))||((hc==hs+4)&&((vc>=vs+2&&vc<=vs+3)||(vc==vs+8)));
			//B
			8'd66:yes=((hc==hs+1||hc==hs+6)&&(vc==vs+2||vc==vs+11))||((hc==hs+2||hc==hs+3)&&(vc>=vs+2&&vc<=vs+11))||((hc==hs+4||hc==hs+5)&&(vc==vs+2||vc==vs+6||vc==vs+11))||((hc==hs+7)&&((vc>=vs+3&&vc<=vs+5)||(vc>=vs+7&&vc<=vs+10)));
			//C
			8'd67:yes=((hc==hs+1)&&(vc>=vs+4&&vc<=vs+9))||((hc==hs+2)&&(vc>=vs+3&&vc<=vs+10))||((hc==hs+3||hc==hs+6)&&((vc>=vs+2&&vc<=vs+3)||(vc>=vs+10&&vc<=vs+11)))||((hc==hs+4||hc==hs+5)&&(vc==vs+2||vc==vs+11))||((hc==hs+7)&&((vc>=vs+3&&vc<=vs+4)||(vc>=vs+9&&vc<=vs+10)));
			//D
			8'd68:yes=((hc==hs+1||hc==hs+4)&&(vc==vs+2||vc==vs+11))||((hc==hs+2||hc==hs+3)&&(vc>=vs+2&&vc<=vs+11))||((hc==hs+5)&&((vc>=vs+2&&vc<=vs+11)||(vc>=vs+10&&vc<=vs+11)))||((hc==hs+6)&&(vc>=vs+3&&vc<=vs+10))||((hc==hs+7)&&(vc>=vs+4&&vc==vs+9));
			//E
			8'd69:yes=((hc==hs+1)&&(vc==vs+2||vc==vs+11))||((hc==hs+2||hc==hs+3)&&(vc>=vs+2&&vc<=vs+11))||((hc==hs+4)&&(vc==vs+2||vc==vs+6||vc==vs+11))||((hc==hs+5)&&(vc==vs+2||(vc>=vs+5&&vc<=vs+7)||vc==vs+11))||((hc==hs+6)&&((vc>=vs+2&&vc<=vs+3)||(vc>=vs+10&&vc<=vs+11)))||((hc==hs+7)&&((vc>=vs+2&&vc<=vs+4)||(vc>=vs+9&&vc<=vs+11)));
			//F
			8'd70:yes=((hc==hs+1)&&(vc==vs+2||vc==vs+11))||((hc==hs+2||hc==hs+3)&&(vc>=vs+2&&vc<=vs+11))||((hc==hs+4)&&(vc==vs+2||vc==vs+6||vc==vs+11))||((hc==hs+5)&&(vc==vs+2||(vc>=vs+5&&vc<=vs+7)))||((hc==hs+6)&&(vc>=vs+2&&vc<=vs+3))||((hc==hs+7)&&(vc>=vs+2&&vc<=vs+4));
			//G
			8'd71:yes=((vc==vs+2)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||0))||0;
			//H
			8'd72:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//I
			8'd73:yes=((vc==vs+2)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+4)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+5)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+9)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+10)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+11)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//J
			8'd74:yes=((vc==vs+2)&&((hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+3)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+4)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||0;
			//K
			8'd75:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//L
			8'd76:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//M
			8'd77:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||0;
			//N
			8'd78:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//O
			8'd79:yes=((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//P
			8'd80:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||0))||0;
			//Q
			8'd81:yes=((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+12)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+13)&&((hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//R
			8'd82:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//S
			8'd83:yes=((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+6)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//T
			8'd84:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+4)||(hc==hs+5)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+9)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+10)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+11)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//U
			8'd85:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//V
			8'd86:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+11)&&((hc==hs+4)||(hc==hs+5)||0))||0;
			//W
			8'd87:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//X
			8'd88:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||0;
			//Y
			8'd89:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+9)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+10)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+11)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//Z
			8'd90:yes=((vc==vs+2)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+3)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+8)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+11)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||0;
			//a
			8'd97:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+5)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//b
			8'd98:yes=((vc==vs+1)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||0))||((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//c
			8'd99:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//d
			8'd100:yes=((vc==vs+1)&&((hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+2)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+4)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//e
			8'd101:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//f
			8'd102:yes=((vc==vs+1)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||0))||0;
			//g
			8'd103:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+11)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+12)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+13)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||0;
			//h
			8'd104:yes=((vc==vs+1)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||0))||((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//i
			8'd105:yes=((vc==vs+1)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+2)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+4)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+5)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+9)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+10)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//j
			8'd106:yes=((vc==vs+1)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+2)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+4)&&((hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+12)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+13)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//k
			8'd107:yes=((vc==vs+1)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||0))||((vc==vs+2)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+3)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//l
			8'd108:yes=((vc==vs+1)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+2)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+3)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+4)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+5)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+9)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+10)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//m
			8'd109:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||0;
			//n
			8'd110:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//o
			8'd111:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//p
			8'd112:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+11)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+12)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+13)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||0))||0;
			//q
			8'd113:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+11)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+12)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+13)&&((hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//r
			8'd114:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||0))||0;
			//s
			8'd115:yes=((vc==vs+4)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+7)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//t
			8'd116:yes=((vc==vs+1)&&((hc==hs+4)||0))||((vc==vs+2)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+3)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+6)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+7)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+8)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+9)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||0;
			//u
			8'd117:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//v
			8'd118:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+10)&&((hc==hs+4)||(hc==hs+5)||0))||0;
			//w
			8'd119:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+4)||(hc==hs+5)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||0;
			//x
			8'd120:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||((vc==vs+5)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+7)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+8)&&((hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+9)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+7)||(hc==hs+8)||0))||0;
			//y
			8'd121:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+6)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+7)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+8)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+11)&&((hc==hs+6)||(hc==hs+7)||0))||((vc==vs+12)&&((hc==hs+5)||(hc==hs+6)||0))||((vc==vs+13)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||0))||0;
			//z
			8'd122:yes=((vc==vs+4)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+5)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+5)||(hc==hs+6)||0))||((vc==vs+6)&&((hc==hs+4)||(hc==hs+5)||0))||((vc==vs+7)&&((hc==hs+3)||(hc==hs+4)||0))||((vc==vs+8)&&((hc==hs+2)||(hc==hs+3)||0))||((vc==vs+9)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+6)||(hc==hs+7)||0))||((vc==vs+10)&&((hc==hs+1)||(hc==hs+2)||(hc==hs+3)||(hc==hs+4)||(hc==hs+5)||(hc==hs+6)||(hc==hs+7)||0))||0;
			default:yes=0;
		endcase
	end
endmodule

module clickable_num6_left(input[17:0] num, input[3:0] th, input[3:0] hun, input[3:0] ten, input[3:0] ones, input[10:0] hc, input[10:0] vc, input[10:0] hs, input[10:0] vs, input[10:0] mx, input[10:0] my, output text_out, output within);
parameter x_width = 15;
parameter x_space = 8;
parameter y_width = 30;

wire [5:0] text;
wire [3:0] hth;
wire [3:0] tth;

assign hth = (num % 1000000) / 100000;
assign tth = (num % 100000) / 10000;

vga_seg a1(hth, hc, vc, hs, vs, text[5]);
vga_seg a2(tth, hc, vc, hs+x_width+x_space, vs, text[4]);
vga_seg a3(th, hc, vc, hs+x_width+x_space+x_width+x_space, vs, text[3]);
vga_seg a4(hun, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[2]);
vga_seg a5(ten, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[1]);
vga_seg a6(ones, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[0]);

assign text_out = (( | hth ) ? ( | text[5:0] ) :
                   ( | tth ) ? ( | text[4:0] ) :
                   ( | th )  ? ( | text[3:0] ) : 
                   ( | hun ) ? ( | text[2:0] ) : 
                   ( | ten ) ? ( | text[1:0] ) : 
                                   text[0])? 1 : 0;
                                   
assign within = (mx>=hs && mx<=hs+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space+x_width && my>=vs && my<=vs+y_width);
endmodule

module clickable_num6_right(input[17:0] num, input[3:0] th, input[3:0] hun, input[3:0] ten, input[3:0] ones, input[10:0] hc, input[10:0] vc, input[10:0] hs, input[10:0] vs, input[10:0] mx, input[10:0] my, output text_out, output within);
parameter x_width = 15;
parameter x_space = 8;
parameter y_width = 30;

wire [5:0] text;
wire [3:0] hth;
wire [3:0] tth;

assign hth = (num % 1000000) / 100000;
assign tth = (num % 100000) / 10000;

wire hth_ne = ( | hth );
wire tth_ne = ( | tth );
wire th_ne = ( | th );
wire hun_ne = ( | hun );
wire ten_ne = ( | ten );

wire[3:0] d1 = hth_ne ? hth :
               tth_ne ? tth :
               th_ne  ? th : 
               hun_ne ? hun : 
               ten_ne ? ten : ones;

wire[3:0] d2 = hth_ne ? tth :
			   tth_ne ? th :
			   th_ne  ? hun : 
			   hun_ne ? ten : ones;

wire[3:0] d3 = hth_ne ? th :
			   tth_ne ? hun :
			   th_ne  ? ten : ones;

wire[3:0] d4 = hth_ne ? hun :
			   tth_ne ? ten : ones;

wire[3:0] d5 = hth_ne ? ten : ones;

wire[3:0] d6 = ones;

vga_seg a1(d1, hc, vc, hs, vs, text[5]);
vga_seg a2(d2, hc, vc, hs+x_width+x_space, vs, text[4]);
vga_seg a3(d3, hc, vc, hs+x_width+x_space+x_width+x_space, vs, text[3]);
vga_seg a4(d4, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[2]);
vga_seg a5(d5, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[1]);
vga_seg a6(d6, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[0]);

assign text_out = (hth_ne ? ( | text[5:0] ) :
                   tth_ne ? ( | text[5:1] ) :
                   th_ne  ? ( | text[5:2] ) : 
                   hun_ne ? ( | text[5:3] ) : 
                   ten_ne ? ( | text[5:4] ) : 
                                text[5]   )? 1 : 0;
                                   
assign within = (mx>=hs && mx<=hs+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space+x_width+x_space+x_width && my>=vs && my<=vs+y_width);
endmodule

module clickable_num4(input[15:0] num, input[3:0] th, input[3:0] hun, input[3:0] ten, input[3:0] ones, input[10:0] hc, input[10:0] vc, input[10:0] hs, input[10:0] vs, input[10:0] mx, input[10:0] my, output text_out, output within);
parameter x_width = 15;
parameter x_space = 8;

wire [4:0] text;

vga_seg a3(th, hc, vc, hs, vs, text[3]);
vga_seg a4(hun, hc, vc, hs+x_width+x_space, vs, text[2]);
vga_seg a5(ten, hc, vc, hs+x_width+x_space+x_width+x_space, vs, text[1]);
vga_seg a6(ones, hc, vc, hs+x_width+x_space+x_width+x_space+x_width+x_space, vs, text[0]);

assign text_out = (( | th )  ? ( | text[3:0] ) : 
                   ( | hun ) ? ( | text[2:0] ) : 
                   ( | ten ) ? ( | text[1:0] ) : 
                                   text[0])? 1 : 0;
                                   
assign within = (mx>=hs && mx<=hs+120 && my>=vs && my<=vs+30);
endmodule

module region_mouse_white(input[10:0] x, input[10:0] y, input[10:0] mx, input[10:0] my, output[3:0] yes);
assign yes = (((y==(my+1))&&((x==(mx+1))||0))||((y==(my+2))&&((x==(mx+1))||(x==(mx+2))||0))||((y==(my+3))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||0))||((y==(my+4))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||(x==(mx+4))||0))||((y==(my+5))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||(x==(mx+4))||(x==(mx+5))||0))||((y==(my+6))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||(x==(mx+4))||(x==(mx+5))||(x==(mx+6))||0))||((y==(my+7))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||(x==(mx+4))||(x==(mx+5))||(x==(mx+6))||(x==(mx+7))||0))||((y==(my+8))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||(x==(mx+4))||(x==(mx+5))||0))||((y==(my+9))&&((x==(mx+1))||(x==(mx+2))||(x==(mx+3))||(x==(mx+4))||(x==(mx+5))||0))||((y==(my+10))&&((x==(mx+1))||(x==(mx+4))||(x==(mx+5))||0))||((y==(my+11))&&((x==(mx+5))||(x==(mx+6))||0))||((y==(my+12))&&((x==(mx+5))||(x==(mx+6))||0))||((y==(my+13))&&((x==(mx+6))||(x==(mx+7))||0))||((y==(my+14))&&((x==(mx+6))||(x==(mx+7))||0))||0) ? 4'b1111 : 4'b0;
endmodule

module region_mouse_black(input[10:0] x, input[10:0] y, input[10:0] mx, input[10:0] my, output[3:0] yes);
assign yes = (((y==(my+0))&&((x==(mx+0))||(x==(mx+1))||0))||((y==(my+1))&&((x==(mx+0))||(x==(mx+2))||0))||((y==(my+2))&&((x==(mx+0))||(x==(mx+3))||0))||((y==(my+3))&&((x==(mx+0))||(x==(mx+4))||0))||((y==(my+4))&&((x==(mx+0))||(x==(mx+5))||0))||((y==(my+5))&&((x==(mx+0))||(x==(mx+6))||0))||((y==(my+6))&&((x==(mx+0))||(x==(mx+7))||0))||((y==(my+7))&&((x==(mx+0))||(x==(mx+8))||0))||((y==(my+8))&&((x==(mx+0))||(x==(mx+6))||(x==(mx+7))||(x==(mx+8))||(x==(mx+9))||0))||((y==(my+9))&&((x==(mx+0))||(x==(mx+6))||0))||((y==(my+10))&&((x==(mx+0))||(x==(mx+2))||(x==(mx+3))||(x==(mx+6))||0))||((y==(my+11))&&((x==(mx+0))||(x==(mx+1))||(x==(mx+4))||(x==(mx+7))||0))||((y==(my+12))&&((x==(mx+0))||(x==(mx+4))||(x==(mx+7))||0))||((y==(my+13))&&((x==(mx+5))||(x==(mx+8))||0))||((y==(my+14))&&((x==(mx+5))||(x==(mx+8))||0))||((y==(my+15))&&((x==(mx+6))||(x==(mx+7))||0))||0) ? 4'b1111 : 4'b0;
endmodule

module vga_seg(
    input [3:0] num,
    input [10:0] hc,
    input [10:0] vc,
    input [10:0] hs,
    input [10:0] vs,
    output yes);

wire a = (hc>=hs+2 && hc<=hs+13 && vc>=vs && vc<=vs+2);
wire b = (hc>=hs+13 && hc<=hs+15 && vc>=vs+2 && vc<=vs+14);
wire c = (hc>=hs+13 && hc<=hs+15 && vc>=vs+16 && vc<=vs+28);
wire d = (hc>=hs+2 && hc<=hs+13 && vc>=vs+28 && vc<=vs+30);
wire e = (hc>=hs && hc<=hs+2 && vc>=vs+16 && vc<=vs+28);
wire f = (hc>=hs && hc<=hs+2 && vc>=vs+2 && vc<=vs+14);
wire g = (hc>=hs+2 && hc<=hs+13 && vc>=vs+14 && vc<=vs+16);

assign yes = (num == 0) ? a|b|c|d|e|f : 
             (num == 1) ? b|c :
             (num == 2) ? a|b|d|e|g :
             (num == 3) ? a|b|c|d|g :
             (num == 4) ? b|c|f|g :
             (num == 5) ? a|c|d|f|g : 
             (num == 6) ? a|c|d|e|f|g :
             (num == 7) ? a|b|c :
             (num == 8) ? a|b|c|d|e|f|g :
             (num == 9) ? a|b|c|d|f|g : 0;
endmodule