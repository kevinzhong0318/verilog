`include "數位系統實習/LAB7/LAB7_1/LAB7_1.v"
`timescale 1ps/1ps

module t_LAB7_1;
reg clk;
reg in;
reg rst;
// wires                                               
wire out;
wire [1:0] out_state;

// assign statements (if any)                          
LAB7_1 i1 (
// port map - connection between master ports and signals/registers   
	.clk(clk),
	.in(in),
	.out(out),
	.out_state(out_state),
	.rst(rst)
);
initial 
begin 
#100000 $stop;
end 

// clk
always
begin
	clk = 1'b0;
	clk = #5000 1'b1;
	#5000;
end 

// in
initial
begin
	in = 1'b1;
	in = #40000 1'b0;
	in = #10000 1'b1;
end 

// rst
initial
begin
	rst = 1'b0;
	rst = #10000 1'b1;
end 
initial begin
    $dumpfile("t_LAB7_1.vcd");
    $dumpvars(0, t_LAB7_1);
end
endmodule