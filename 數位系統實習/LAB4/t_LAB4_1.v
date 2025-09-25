`include "LAB4_1.v"
`timescale 1ps/1ps

module t_LAB4_1 ();
// constants                                           
// general purpose registers
reg [3:0] A;
reg [3:0] B;
reg C0;
// wires                                               
wire C4;
wire [3:0] S;

// assign statements (if any)                          
LAB4_1 i1 (
// port map - connection between master ports and signals/registers   
	.A(A),
	.B(B),
	.C0(C0),
	.C4(C4),
	.S(S)
);
initial 
begin 
#1000000 $stop;
end 
// A[ 3 ]
initial
begin
	repeat(6)
	begin
		A[3] = 1'b0;
		A[3] = #80000 1'b1;
		# 80000;
	end
	A[3] = 1'b0;
end 
// A[ 2 ]
initial
begin
	repeat(12)
	begin
		A[2] = 1'b0;
		A[2] = #40000 1'b1;
		# 40000;
	end
	A[2] = 1'b0;
end 
// A[ 1 ]
always
begin
	A[1] = 1'b0;
	A[1] = #20000 1'b1;
	#20000;
end 
// A[ 0 ]
always
begin
	A[0] = 1'b0;
	A[0] = #10000 1'b1;
	#10000;
end 
// B[ 3 ]
initial
begin
	B[3] = 1'b0;
	# 50000;
	repeat(5)
	begin
		B[3] = 1'b1;
		B[3] = #80000 1'b0;
		# 80000;
	end
	B[3] = 1'b1;
	B[3] = #80000 1'b0;
end 
// B[ 2 ]
initial
begin
	B[2] = 1'b0;
	# 10000;
	repeat(12)
	begin
		B[2] = 1'b1;
		B[2] = #40000 1'b0;
		# 40000;
	end
	B[2] = 1'b1;
end 
// B[ 1 ]
initial
begin
	B[1] = 1'b1;
	# 10000;
	repeat(24)
	begin
		B[1] = 1'b0;
		B[1] = #20000 1'b1;
		# 20000;
	end
	B[1] = 1'b0;
	B[1] = #20000 1'b1;
end 
// B[ 0 ]
always
begin
	B[0] = 1'b1;
	B[0] = #10000 1'b0;
	#10000;
end 

// C0
initial
begin
	C0 = 1'b0;
	C0 = #60000 1'b1;
	C0 = #50000 1'b0;
end 

initial begin
    $dumpfile("t_LAB4_1.vcd");
    $dumpvars(0,t_LAB4_1);
end
endmodule //t_LAB4_1