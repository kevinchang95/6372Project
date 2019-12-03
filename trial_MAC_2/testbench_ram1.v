`timescale 1ns / 1ps

module testbench_ram1 ();

reg clk;

reg [9:0] addr;
reg write_en;
reg read_en;
reg [63:0] data1;
wire [63:0] q;

initial begin

	clk = 0;
	write_en = 0;
	read_en = 0;
	addr = 6;
	data1 = 64; 
	
	
	#20 clk = !clk; write_en = 0;read_en = 1;  
	#20 clk = !clk; write_en = 0;
	#20 clk = !clk; //read_en  = 1;
	#20 clk = !clk; //read_en  = 0;
	#20 clk = !clk;
	#20 clk = !clk;
	
	
end



/*always
	#20 begin
	
	clk = !clk;
	//if()
	//X <= X + 1; Y <= Y + 1;
	
	
end
*/

//mac1 U1(clk, X , Y, result);
	
	ram1  r1(addr,clk,data1,read_en,write_en,
	q);



endmodule