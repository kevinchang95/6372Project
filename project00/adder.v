module adder(
	,in_1
	,in_2
	,sum);
input [33:0] in_1;
input [33:0] in_2;
output [34:0] sum;

reg [34:0] sum;

always @(in_1 or in_2) begin
	sum = in_1 + in_2;
	end
endmodule
