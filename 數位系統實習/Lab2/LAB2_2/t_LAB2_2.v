`include "LAB2_2.v"
`timescale 1ps/1ps

module t_LAB2_2 ;

initial begin
    $dumpfile("LAB2_2.vcd");
    $dumpvars(0, t_LAB2_2);
end

// constants                                           
// general purpose registers
reg [1:0] A;
reg [1:0] B;
// wires                                               
wire [3:0] C;

// assign statements (if any)                          
LAB2_2 i1 (
// port map - connection between master ports and signals/registers   
	.A(A),
	.B(B),
	.C(C)
);
initial 
begin 
#300000 $finish;
end 
// A[ 1 ]
initial
begin
	A[1] = 1'b0;
	A[1] = #30000 1'b1;
	A[1] = #30000 1'b0;
	A[1] = #30000 1'b1;
	A[1] = #30000 1'b0;
	A[1] = #30000 1'b1;
	A[1] = #30000 1'b0;
	A[1] = #30000 1'b1;
	A[1] = #30000 1'b0;
end 
// A[ 0 ]
initial
begin
	repeat(2)
	begin
		A[0] = 1'b0;
		A[0] = #15000 1'b1;
		# 15000;
	end
	repeat(2)
	begin
		A[0] = 1'b0;
		A[0] = #15000 1'b1;
		# 15000;
	end
	repeat(2)
	begin
		A[0] = 1'b0;
		A[0] = #15000 1'b1;
		# 15000;
	end
	repeat(2)
	begin
		A[0] = 1'b0;
		A[0] = #15000 1'b1;
		# 15000;
	end
	A[0] = 1'b0;
end 
// B[ 1 ]
initial
begin
	B[1] = 1'b0;
	B[1] = #40000 1'b1;
	B[1] = #40000 1'b0;
	B[1] = #40000 1'b1;
	B[1] = #40000 1'b0;
	B[1] = #40000 1'b1;
	B[1] = #40000 1'b0;
end 
// B[ 0 ]
initial
begin
	repeat(2)
	begin
		B[0] = 1'b0;
		B[0] = #20000 1'b1;
		# 20000;
	end
	repeat(2)
	begin
		B[0] = 1'b0;
		B[0] = #20000 1'b1;
		# 20000;
	end
	repeat(2)
	begin
		B[0] = 1'b0;
		B[0] = #20000 1'b1;
		# 20000;
	end
	B[0] = 1'b0;
end 

endmodule //t_LAB2_2