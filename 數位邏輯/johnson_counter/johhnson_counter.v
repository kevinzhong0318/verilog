module counter(output s0,s1,s2,s3,s4,s5,s6,s7, input clk,clear);
DFF M0(A,clk,clear,!E);
DFF M1(B,clk,clear,A);
DFF M2(C,clk,clear,B);
DFF M3(E,clk,clear,C);
and(s0,!A,!E);
and(s1,A,!B);
and(s2,B,!C);
and(s3,C,!E);
and(s4,E,A);
and(s5,!A,B);
and(s6,!B,C);
and(s7,!C,E);
endmodule
module DFF(output reg Q,input clk,clear,D);
always@(posedge clk,negedge clear)
if(clear==1'b0)
Q<=1'b0;else Q<=D;
endmodule
module test();
wire s0,s1,s2,s3,s4,s5,s6,s7;
reg clk,clear;
counter M0(s0,s1,s2,s3,s4,s5,s6,s7,clk,clear);
initial #400 $finish;
initial begin clk=1'b0;forever #5clk=!clk;end
initial fork
clear=1'b0;
#5clear=1'b1;
#200clear =1'b0;
#240clear=1'b1;
$dumpfile("dump.vcd");
$dumpvars(0,test);
join
endmodule