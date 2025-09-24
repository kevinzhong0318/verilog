`include "LAB3_2.v"
`timescale 1ps / 1ps
module t_LAB3_2 ();
reg en;
reg [3:0] in;
reg [1:0] sel;
// wires                                               
wire out;

LAB3_2 i1 (
// port map - connection between master ports and signals/registers   
	.en(en),
	.in(in),
	.out(out),
	.sel(sel)
);
initial 
begin 
#1000000 $stop;
end 

// en
initial
begin
	en = 1'b1;
	en = #200000 1'b0;
	en = #200000 1'b1;
	en = #230000 1'b0;
	en = #100000 1'b1;
end 
// in[ 3 ]
initial
begin
	repeat(3)
	begin
		in[3] = 1'b0;
		in[3] = #160000 1'b1;
		# 160000;
	end
	in[3] = 1'b0;
end 
// in[ 2 ]
initial
begin
	repeat(6)
	begin
		in[2] = 1'b0;
		in[2] = #80000 1'b1;
		# 80000;
	end
	in[2] = 1'b0;
end 
// in[ 1 ]
initial
begin
	repeat(12)
	begin
		in[1] = 1'b0;
		in[1] = #40000 1'b1;
		# 40000;
	end
	in[1] = 1'b0;
end 
// in[ 0 ]
always
begin
	in[0] = 1'b0;
	in[0] = #20000 1'b1;
	#20000;
end 
// sel[ 1 ]
initial
begin
	repeat(12)
	begin
		sel[1] = 1'b0;
		sel[1] = #40000 1'b1;
		# 40000;
	end
	sel[1] = 1'b0;
end 
// sel[ 0 ]
always
begin
	sel[0] = 1'b0;
	sel[0] = #20000 1'b1;
	#20000;
end 

initial begin
    $dumpfile("t_LAB3_2.vcd");
    $dumpvars(0,t_LAB3_2);
end

endmodule //t_LAB3_2