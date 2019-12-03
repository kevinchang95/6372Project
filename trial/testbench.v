`timescale 1ns / 1ps

module testbench ();

reg Cin;
reg [15:0] X,Y;

wire [15:0] sum;
wire Cout;

initial begin

	X <= 0; Y <= 0; Cin <= 0;
	#20 X <= 0; Y <= 10; Cin <= 0;
	#20 X <= 10; Y <= 10; Cin <= 0;
	#20 X <= 10; Y <= 10; Cin <= 1;
	#20 X <= 16'hFFF0; Y <= 16'hF; Cin <= 0;
	#20 X <= 16'hFFF0; Y <= 16'hF; Cin <= 1;
end

trial_project U1(Cin , X , Y, sum, Cout);

endmodule













