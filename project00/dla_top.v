`timescale 1 ps / 1 ps

module dla_top (
	 dla_core_clk
	//,dla_reset
	,dataa_in1
	,dataa_in2
	,dataa_in3
	,dataa_in4
	,dataa_in5
	,dataa_in6
	,dataa_in7
	,dataa_in8
	
	,datab_in1
	,datab_in2
	,datab_in3
	,datab_in4
	,datab_in5
	,datab_in6
	,datab_in7
	,datab_in8
	
	,result_top
	);

input dla_core_clk;
//input dla_reset;
input [15:0] dataa_in1;
input [15:0] dataa_in2;
input [15:0] datab_in1;
input [15:0] datab_in2;
input [15:0] dataa_in3;
input [15:0] dataa_in4;
input [15:0] datab_in3;
input [15:0] datab_in4;

input [15:0] dataa_in5;
input [15:0] dataa_in6;
input [15:0] datab_in5;
input [15:0] datab_in6;
input [15:0] dataa_in7;
input [15:0] dataa_in8;
input [15:0] datab_in7;
input [15:0] datab_in8;

output [34:0] result_top;

wire [33:0] result_1;
wire [33:0] result_2;

mac mac_inst1(
	.clock0(dla_core_clk),
	.dataa_0(dataa_in1),
	.dataa_1(dataa_in2),
	.datab_0(datab_in1),
	.datab_1(datab_in2),
	.dataa_2(dataa_in3),
	.dataa_3(dataa_in4),
	.datab_2(datab_in3),
	.datab_3(datab_in4),
	.result(result_1)
	);

mac mac_inst2(
	.clock0(dla_core_clk),
	.dataa_0(dataa_in5),
	.dataa_1(dataa_in6),
	.datab_0(datab_in5),
	.datab_1(datab_in6),
	.dataa_2(dataa_in7),
	.dataa_3(dataa_in8),
	.datab_2(datab_in7),
	.datab_3(datab_in8),
	.result(result_2)
	);

adder adder_inst1(
	.in_1(result_1),
	.in_2(result_2),
	.sum(result_top)
	);

endmodule
