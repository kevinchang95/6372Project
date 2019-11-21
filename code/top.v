`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/13 20:17:17
// Design Name: 
// Module Name: top
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


module top(
    clk								//System clock
//    ,ena
//    ,wea
//    ,ifm_addr
//    ,weight_addr
    ,dina							//Needed for memory port, no use!
    ,result);						//temporary esult for one layer, partial sum

input clk;
//input ena;
//input wea;
input [63:0] dina;
output [33:0] result;
wire [3:0] rr;						//index of row, Connection : loop counter ----> controller 
wire [3:0] cc;						//index of column, Connection : loop counter ----> controller
wire [7:0] ifm_addr;				//input feature map address : controller ----> input memory(buffer)
wire [7:0] weight_addr;			//weight address : controller ----> weight memory(buffer)
wire w_ena;							//Weight memory enalble : controller ----> memory
wire in_ena;						//input mempory enable : 
wire wea;							//write enable (no use, set to 0)
wire [63:0] ifm_dout;			//input feature map output (64 bit, 4 data)
wire [63:0] weight_dout;		//weight output (64bit, 4 data)
wire [15:0] ifm_0, ifm_1,ifm_2,ifm_3;		//4 wire for input feature
wire [15:0] w_0, w_1,w_2,w_3;					//4 wire for weight
wire carry_o;   // suspended wire, any problem?			//Check if outer loop finished(row and column are finished)

loop address(						//instantiation of loop_counter.v module loop named address
    .clk(clk),						//format: module wire name(real wire name)
    .r(rr),
    .c(cc),
    .carry_o(carry_o)
    );
controller ctl(
    .clock(clk),
    .r(rr),
    .c(cc),
    .ifm_addr(ifm_addr),
    .weight_addr(weight_addr),
    .weight_ena(w_ena),
    .input_ena(in_ena),
    .wea(wea));
    
blk_mem_input ifm_buf (			//Instantiation of IP CORE "memory". NEEDS MODIFY!!!!!!
  .clka(clk),    // input wire clka
  .ena(in_ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(ifm_addr),  // input wire [7 : 0] addra
  .dina(dina),    // input wire [63 : 0] dina
  .douta(ifm_dout)  // output wire [63 : 0] douta
);

blk_mem_weight weight_buf (	//Instantiation of IP CORE "memory". NEEDS MODIFY!!!
  .clka(clk),    // input wire clka
  .ena(w_ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(weight_addr),  // input wire [7 : 0] addra
  .dina(dina),    // input wire [63 : 0] dina
  .douta(weight_dout)  // output wire [63 : 0] douta
);
assign ifm_0 = ifm_dout[63:48];			//Split input and weight data
assign ifm_1 = ifm_dout[47:32];
assign ifm_2 = ifm_dout[31:16];
assign ifm_3 = ifm_dout[15:0];

assign w_0 = weight_dout[63:48];
assign w_1 = weight_dout[47:32];
assign w_2 = weight_dout[31:16];
assign w_3 = weight_dout[15:0];

mac inst(										//Instantiation of multiAdd element
    .clk(clk),
    .ifm_0(ifm_0),
    .ifm_1(ifm_1),
    .ifm_2(ifm_2),
    .ifm_3(ifm_3),
    .w_0(w_0),
    .w_1(w_1),
    .w_2(w_2),
    .w_3(w_3),
    .result(result));						//result of the mac is the temporary result of the top.
    
//blk_mem_output out_buf
endmodule
