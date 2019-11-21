`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/13 20:27:56
// Design Name: 
// Module Name: tb3
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


module tb3;
reg clk;
//reg ena;
//reg wea;
//reg [7:0] addra = 8'h00;
//reg [7:0] addrb = 8'h00;
reg [63:0] data_in = 0;
wire [33:0] out;

top top_inst(
   .clk(clk),    // input wire clka
//  .ena(ena),      // input wire ena
//  .wea(wea),      // input wire [0 : 0] wea
//  .ifm_addr(addra),
//  .weight_addr(addrb),  // input wire [7 : 0] addra
  .dina(data_in),    // input wire [15 : 0] dina
  .result(out));
initial begin
    clk = 0;
//    ena = 1;
//    wea = 0;
    end
always 
    #10 begin 
    clk = !clk;
    end

endmodule
