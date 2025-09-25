`include "LAB4_2.v"
`timescale 1ps/1ps

module t_LAB4_2 ();
// constants                                           
// general purpose registers
reg CLK;
reg J;
reg K;
reg reset;
reg set;
// wires                                               
wire Q;

// assign statements (if any)                          
LAB4_2 i1 (
// port map - connection between master ports and signals/registers   
	.CLK(CLK),
	.J(J),
	.K(K),
	.Q(Q),
	.reset(reset),
	.set(set)
);
initial 
begin 
#160000 $stop;
end 

// J
always
begin
	J = 1'b0;
	J = #10000 1'b1;
	#10000;
end 

// K
always
begin
	K = 1'b0;
	K = #20000 1'b1;
	#20000;
end 

// CLK
always
begin
	CLK = 1'b0;
	CLK = #2500 1'b1;
	#2500;
end 

// reset
initial
begin
	reset = 1'b1;
	reset = #55000 1'b0;
end 

// set
initial
begin
	set = 1'b0;
	set = #55000 1'b1;
	set = #45000 1'b0;
end 

initial begin
    $dumpfile("LAB4_2.vcd");
    $dumpvars(0, t_LAB4_2);
end
endmodule //t_LAB4_2