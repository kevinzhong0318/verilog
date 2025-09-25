`include "LAB4_3.v"
`timescale 1ps/1ps

module t_LAB4_3;
// constants                                           
// general purpose registers
reg [3:0] D_in;
reg clk;
reg load;
reg rst;
// wires                                               
wire [3:0] D_out;

// assign statements (if any)                          
LAB4_3 i1 (
// port map - connection between master ports and signals/registers   
	.D_in(D_in),
	.D_out(D_out),
	.clk(clk),
	.load(load),
	.rst(rst)
);
initial 
begin 
#200000 $stop;
end 
// D_in[ 3 ]
initial
begin
	D_in[3] = 1'b0;
	D_in[3] = #120000 1'b1;
	D_in[3] = #30000 1'b0;
end 
// D_in[ 2 ]
initial
begin
	D_in[2] = 1'b1;
	D_in[2] = #60000 1'b0;
	D_in[2] = #30000 1'b1;
	D_in[2] = #90000 1'b0;
end 
// D_in[ 1 ]
initial
begin
	D_in[1] = 1'b0;
	D_in[1] = #60000 1'b1;
	D_in[1] = #30000 1'b0;
	D_in[1] = #90000 1'b1;
end 
// D_in[ 0 ]
initial
begin
	D_in[0] = 1'b0;
	D_in[0] = #30000 1'b1;
	D_in[0] = #30000 1'b0;
	D_in[0] = #90000 1'b1;
	D_in[0] = #30000 1'b0;
end 

// clk
always
begin
	clk = 1'b0;
	clk = #5000 1'b1;
	#5000;
end 

// load
initial
begin
	load = 1'b1;
	load = #10000 1'b0;
	load = #30000 1'b1;
	load = #10000 1'b0;
	load = #40000 1'b1;
	load = #20000 1'b0;
end 

// rst
initial
begin
	rst = 1'b1;
	rst = #30000 1'b0;
	rst = #10000 1'b1;
end 

initial begin
    $dumpfile("t_LAB4_3.vcd");
    $dumpvars(0, t_LAB4_3);
end

endmodule // t_LAB4_3