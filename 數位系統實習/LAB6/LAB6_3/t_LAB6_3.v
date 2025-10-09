`include "/Users/sammy/Library/CloudStorage/OneDrive-個人/桌面/程式/verilog/數位系統實習/LAB6/LAB6_3/LAB6_3.v"
`timescale 1ps/1ps


module t_LAB6_3 ();
reg clear;
reg clk;
reg s_in;
reg shift_ctrl;
// wires                                               
wire [3:0] p_out1;
wire [3:0] p_out2;

// assign statements (if any)                          
LAB6_3 i1 (
// port map - connection between master ports and signals/registers   
	.clear(clear),
	.clk(clk),
	.p_out1(p_out1),
	.p_out2(p_out2),
	.s_in(s_in),
	.shift_ctrl(shift_ctrl)
);
initial 
begin 
#300000 $stop;
end 

// clear
initial
begin
	clear = 1'b1;
end 

// clk
always
begin
	clk = 1'b0;
	clk = #10000 1'b1;
	#10000;
end 

// s_in
initial
begin
	s_in = 1'b1;
	s_in = #60000 1'b0;
	s_in = #20000 1'b1;
	s_in = #60000 1'b0;
end 

// shift_ctrl
initial
begin
	shift_ctrl = 1'b1;
end 

initial begin
    $dumpfile("t_LAB6_3.vcd");
    $dumpvars(0,t_LAB6_3);
end
endmodule //t_LAB6_3