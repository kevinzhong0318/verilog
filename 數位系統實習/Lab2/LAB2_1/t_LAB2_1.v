`include "LAB2_1.v"
`timescale 1ps / 1ps

module t_LAB2_1;
// constants                                           
// general purpose registers
reg X1;
reg X2;
reg X3;
reg X4;
// wires                                               
wire f;
wire g;
wire h;

initial begin
    $dumpfile("t_LAB2_1.vcd");
    $dumpvars(0,t_LAB2_1);
end

// assign statements (if any)                          
LAB2_1 i1 (
// port map - connection between master ports and signals/registers   
	.X1(X1),
	.X2(X2),
	.X3(X3),
	.X4(X4),
	.f(f),
	.g(g),
	.h(h)
);
initial 
begin 
#110000 $finish;
end 

// X1
initial
begin
	X1 = 1'b0;
	X1 = #40000 1'b1;
	X1 = #40000 1'b0;
end 

// X2
initial
begin
	repeat(2)
	begin
		X2 = 1'b0;
		X2 = #20000 1'b1;
		# 20000;
	end
	X2 = 1'b0;
end 

// X3
initial
begin
	repeat(4)
	begin
		X3 = 1'b0;
		X3 = #10000 1'b1;
		# 10000;
	end
	X3 = 1'b0;
end 

// X4
initial
begin
	repeat(8)
	begin
		X4 = 1'b0;
		X4 = #5000 1'b1;
		# 5000;
	end
	X4 = 1'b0;
end 

   



endmodule   