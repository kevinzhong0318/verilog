`include "LAB5_2.v"
`timescale 1ps/1ps
module t_LAB5_2 ();

reg clk;
reg rst;
// wires                                               
wire fout;

// assign statements (if any)                          
LAB5_2 i1 (
// port map - connection between master ports and signals/registers   
	.clk(clk),
	.fout(fout),
	.rst(rst)
);
initial 
begin 
#1000000 $stop;
end 

// clk
always
begin
	clk = 1'b0;
	clk = #10000 1'b1;
	#10000;
end 

// rst
initial
begin
	rst = 1'b0;
	rst = #20000 1'b1;
end 


initial begin
    $dumpfile("LAB5_2.vcd");
    $dumpvars(0, t_LAB5_2);
end
endmodule //t_LAB5_2