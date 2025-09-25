`include "LAB3_1.v"
`timescale 1 ps/ 1 ps
module LAB3_1_t ();
// constants                                           
// general purpose registers
reg [31:0] in;
reg [4:0] sel;
// wires                                               
wire out;

initial begin
    $dumpfile("t_LAB3_1.vcd");
    $dumpvars(0,LAB3_1_t);
end

// assign statements (if any)                          
LAB3_1 i1 (
// port map - connection between master ports and signals/registers   
	.in(in),
	.out(out),
	.sel(sel)
);
initial 
begin 
#1000000 $stop;
end 
// in[ 31 ]
initial
begin
	in[31] = 1'b0;
end 
// in[ 30 ]
initial
begin
	in[30] = 1'b0;
end 
// in[ 29 ]
initial
begin
	in[29] = 1'b0;
end 
// in[ 28 ]
initial
begin
	in[28] = 1'b0;
end 
// in[ 27 ]
initial
begin
	in[27] = 1'b0;
end 
// in[ 26 ]
initial
begin
	in[26] = 1'b0;
end 
// in[ 25 ]
initial
begin
	in[25] = 1'b0;
end 
// in[ 24 ]
initial
begin
	in[24] = 1'b0;
end 
// in[ 23 ]
initial
begin
	in[23] = 1'b0;
end 
// in[ 22 ]
initial
begin
	in[22] = 1'b0;
end 
// in[ 21 ]
initial
begin
	in[21] = 1'b0;
end 
// in[ 20 ]
initial
begin
	in[20] = 1'b0;
end 
// in[ 19 ]
initial
begin
	in[19] = 1'b0;
end 
// in[ 18 ]
initial
begin
	in[18] = 1'b0;
end 
// in[ 17 ]
initial
begin
	in[17] = 1'b0;
end 
// in[ 16 ]
initial
begin
	in[16] = 1'b0;
end 
// in[ 15 ]
initial
begin
	in[15] = 1'b0;
end 
// in[ 14 ]
initial
begin
	in[14] = 1'b0;
end 
// in[ 13 ]
initial
begin
	in[13] = 1'b0;
end 
// in[ 12 ]
initial
begin
	in[12] = 1'b0;
end 
// in[ 11 ]
initial
begin
	in[11] = 1'b0;
end 
// in[ 10 ]
initial
begin
	in[10] = 1'b0;
end 
// in[ 9 ]
initial
begin
	in[9] = 1'b0;
end 
// in[ 8 ]
initial
begin
	in[8] = 1'b0;
end 
// in[ 7 ]
initial
begin
	in[7] = 1'b0;
end 
// in[ 6 ]
initial
begin
	in[6] = 1'b0;
end 
// in[ 5 ]
initial
begin
	in[5] = 1'b0;
end 
// in[ 4 ]
initial
begin
	in[4] = 1'b0;
end 
// in[ 3 ]
initial
begin
	in[3] = 1'b0;
end 
// in[ 2 ]
initial
begin
	in[2] = 1'b1;
end 
// in[ 1 ]
initial
begin
	in[1] = 1'b1;
end 
// in[ 0 ]
initial
begin
	in[0] = 1'b1;
end 
// sel[ 4 ]
initial
begin
	repeat(3)
	begin
		sel[4] = 1'b0;
		sel[4] = #160000 1'b1;
		# 160000;
	end
	sel[4] = 1'b0;
end 
// sel[ 3 ]
initial
begin
	repeat(6)
	begin
		sel[3] = 1'b0;
		sel[3] = #80000 1'b1;
		# 80000;
	end
	sel[3] = 1'b0;
end 
// sel[ 2 ]
initial
begin
	repeat(12)
	begin
		sel[2] = 1'b0;
		sel[2] = #40000 1'b1;
		# 40000;
	end
	sel[2] = 1'b0;
end 
// sel[ 1 ]
always
begin
	sel[1] = 1'b0;
	sel[1] = #20000 1'b1;
	#20000;
end 
// sel[ 0 ]
always
begin
	sel[0] = 1'b0;
	sel[0] = #10000 1'b1;
	#10000;
end 

endmodule //LAB3_1_t