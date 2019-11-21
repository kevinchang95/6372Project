`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/13 22:20:04
// Design Name: 
// Module Name: controller
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


module controller(
    clock
    ,r
    ,c
    ,ifm_addr
    ,weight_addr
//    ,out_addr
    ,weight_ena
    ,input_ena
    ,wea
//    ,out_wea             // output buf write enable
    );
parameter in_size = 4;
parameter out_size = 2;
parameter  in_channel = 1;
parameter  out_channel = 1;
parameter  k = 3;
parameter padding = 0;
parameter stride = 0;
input clock;
input [3:0] r;
input [3:0] c;
output [7:0] ifm_addr;
output [7:0] weight_addr;
//output [7:0] out_addr = 0;
output weight_ena = 1;
output input_ena = 1;
output wea;
//output out_wea;


reg [7:0] ifm_addr = 0;
reg [7:0] weight_addr = 0;
reg [7:0] out_addr;
reg weight_ena;
reg input_ena;
reg wea = 0;
reg out_wea = 1;
reg i = 0;
reg j = 0;
//reg r = 0;
//reg c = 0;


//genvar i;
//genvar j;
//genvar r;
//genvar c;
//generate
//always@(posedge clock) begin
//    for(i<=0;i<=k;i<=i+1) begin
//        for(j=0;j<k;j=j+1) begin
//            for(r=0;r<out_size;r=r+1) begin
//                for(c=0;c<out_size;c=c+1) begin
                    
//                        ifm_addr <= (r+i)*in_size + (c+j);
//                        weight_addr <= i*k + j;                //no weight reuse for now!
//                end
//                end
//                end
//                end
//                end
//endgenerate


always@(posedge clock) begin
    ifm_addr <= (r+i)*in_size+(c+j);
    weight_addr <= i*k+j;
    end
    
endmodule
