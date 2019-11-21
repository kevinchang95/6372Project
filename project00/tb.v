`timescale 1 ps / 1 ps

module tb;
	reg clock;
	reg [15:0] a1;
	reg [15:0] a2;
	reg [15:0] a3;
	reg [15:0] a4;
	reg [15:0] a5;
	reg [15:0] a6;
	reg [15:0] a7;
	reg [15:0] a8;
	
	reg [15:0] b1;
	reg [15:0] b2;
	reg [15:0] b3;
	reg [15:0] b4;
	reg [15:0] b5;
	reg [15:0] b6;
	reg [15:0] b7;
	reg [15:0] b8;
	
	wire [34:0] res;
	
	dla_top top(
	.dla_core_clk(clock),
	.dataa_in1(a1),
	.dataa_in2(a2),
	.dataa_in3(a3),
	.dataa_in4(a4),
	.dataa_in5(a5),
	.dataa_in6(a6),
	.dataa_in7(a7),
	.dataa_in8(a8),
	
	.datab_in1(b1),
	.datab_in2(b2),
	.datab_in3(b3),
	.datab_in4(b4),
	.datab_in5(b5),
	.datab_in6(b6),
	.datab_in7(b7),
	.datab_in8(b8),
	
	.result_top(res)
	);
	
	initial
	begin
		clock = 0;
		a1 = 16'h0001;
		a2 = 16'h0001;
		a3 = 16'h0002;
		a4 = 16'h0002;
		b1 = 16'h0001;
		b2 = 16'h0001;
		b3 = 16'h0002;
		b4 = 16'h0002;
		
		a5 = 16'h0001;
		a6 = 16'h0001;
		a7 = 16'h0002;
		a8 = 16'h0002;
		b5 = 16'h0001;
		b6 = 16'h0001;
		b7 = 16'h0002;
		b8 = 16'h0002;
	end
	
	always
	  #10 begin 
	  clock = !clock;
	  //b1 <= b1 + 1;
	  end
endmodule
	  
		