`include "數位系統實習/LAB7/LAB7_3/LAB7_3.v"
`timescale 1ps/1ps

module t_LAB7_3;
// constants                                           
// general purpose registers
reg [7:0] in;
// wires                                               
wire [3:0] hunds;
wire [3:0] ones;
wire [3:0] tens;

// assign statements (if any)                          
LAB7_3 i1 (
// port map - connection between master ports and signals/registers   
	.hunds(hunds),
	.in(in),
	.ones(ones),
	.tens(tens)
);
initial 
begin 
#200000 $stop;
end 
// in[ 7 ]
initial
begin
	in[7] = 1'b1;
end 
// in[ 6 ]
initial
begin
	in[6] = 1'b1;
end 
// in[ 5 ]
initial
begin
	in[5] = 1'b1;
end 
// in[ 4 ]
initial
begin
	in[4] = 1'b1;
	in[4] = #160000 1'b0;
end 
// in[ 3 ]
initial
begin
	in[3] = 1'b1;
	in[3] = #80000 1'b0;
	in[3] = #80000 1'b1;
end 
// in[ 2 ]
initial
begin
	in[2] = 1'b1;
	in[2] = #40000 1'b0;
	in[2] = #40000 1'b1;
	in[2] = #40000 1'b0;
	in[2] = #40000 1'b1;
end 
// in[ 1 ]
initial
begin
	in[1] = 1'b1;
	in[1] = #20000 1'b0;
	# 20000;
	repeat(3)
	begin
		in[1] = 1'b1;
		in[1] = #20000 1'b0;
		# 20000;
	end
	in[1] = 1'b1;
	in[1] = #20000 1'b0;
end 
// in[ 0 ]
initial
begin
	in[0] = 1'b1;
	in[0] = #10000 1'b0;
	# 10000;
	repeat(8)
	begin
		in[0] = 1'b1;
		in[0] = #10000 1'b0;
		# 10000;
	end
	in[0] = 1'b1;
	in[0] = #10000 1'b0;
end 
initial
begin
$dumpfile("t_LAB7_3.vcd");
$dumpvars(0, t_LAB7_3); 
end

endmodule