`include "LAB5_1.v"
`timescale 1ps/1ps
module t_LAB5_1 ();

// constants                                           
// general purpose registers
reg clear;
reg clk;
reg count;
reg [3:0] in;
reg load;
// wires                                               
wire [3:0] out;

// assign statements (if any)                          
LAB5_1 i1 (
// port map - connection between master ports and signals/registers   
	.clear(clear),
	.clk(clk),
	.count(count),
	.in(in),
	.load(load),
	.out(out)
);
initial 
begin 
#500000 $stop;
end 

// clear
initial
begin
	clear = 1'b1;
	clear = #40000 1'b0;
end 

// clk
always
begin
	clk = 1'b0;
	clk = #10000 1'b1;
	#10000;
end 

// count
initial
begin
	count = 1'b0;
	count = #70000 1'b1;
	count = #170000 1'b0;

    count = #40000 1'b1;
    count = #20000 1'b0;
end 

// load
initial
begin
	load = 1'b0;
	load = #40000 1'b1;
	load = #20000 1'b0;
end 
// in[ 3 ]
initial
begin
	in[3] = 1'b0;
	in[3] = #40000 1'b1;
	in[3] = #20000 1'b0;
end 
// in[ 2 ]
initial
begin
	in[2] = 1'b0;
	in[2] = #40000 1'b1;
	in[2] = #20000 1'b0;
end 
// in[ 1 ]
initial
begin
	in[1] = 1'b0;
end 
// in[ 0 ]
initial
begin
	in[0] = 1'b0;
end 

initial begin
    $dumpfile("t_LAB5_1.vcd");
    $dumpvars(0,t_LAB5_1);
end
endmodule //t_LAB5_1