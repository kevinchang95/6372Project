`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/13 13:49:13
// Design Name: 
// Module Name: loop_counter
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


module loop_counter1(
    clk
    ,c
    ,carry
    );
input clk;
output [3:0] c;
output carry;
reg [3:0] c = 0;
reg carry = 0;
always@(posedge clk) begin
    if (c == 1) begin c<=0;carry<=1;end
    else begin c<=c+1;carry<=0;end   
end
endmodule

module loop_counter2(
    carry_in
    ,r
    ,carry_out
    );
input carry_in;
output [3:0] r;
output carry_out;
reg [3:0] r = 0;
reg carry_out = 0;
always@(carry_in) begin
    if ((r==1)&&(carry_in==1)) begin r<=0;carry_out<=1;end
    else if (carry_in == 1) begin r<=r+1;carry_out=0;end
    else begin r <= r;carry_out=0;end
    
end
endmodule

module loop(
    clk
    ,r
    ,c
    ,carry_o);
input clk;
output [3:0] r;
output [3:0] c;
output carry_o;
wire carry1;
loop_counter1 l1(
    .clk(clk),
    .c(c),
    .carry(carry1)
    );
loop_counter2 l2(
    .carry_in(carry1),
    .r(r),
    .carry_out(carry_o));
endmodule
