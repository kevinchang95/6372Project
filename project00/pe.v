`timescale 1 ps/ 1 ps

module pe(
	clock_pe
	//,enable
	//,reset
	,ifm
	,w0
	,w1
	,w2
	,w3
	,w4
	,w5
	,w6
	,w7
	,psm_0
	,psm_1
	,psm_2
	,psm_3
	,psm_4
	,psm_5
	,psm_6
	,psm_7
	//,ready
	);
reg status = 0;

input clock_pe;
input [127:0] ifm;
input [127:0]  w0;
input [127:0]  w1;
input [127:0]  w2;
input [127:0]  w3;
input [127:0]  w4;
input [127:0]  w5;


mac mac_inst1(
	.clock0(clock_pe),
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


	