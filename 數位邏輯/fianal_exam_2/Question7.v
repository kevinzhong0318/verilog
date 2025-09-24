module Question7(output reg [3:0] signal,input clk,reset);
reg [1:0]state;
always@(posedge clk,negedge reset)
if(reset==1'b0)state <=1'b0;else state<=state+1;
always@(state)
case(state)
0: signal<=4'b1000;
1: signal<=4'b0100;
2: signal<=4'b0010;
3: signal<=4'b0001;
default: signal<=4'b1000;
endcase
endmodule
module test();
wire [3:0] signal;
reg clk,reset;
Question7 M0(signal,clk,reset);
initial #150 $finish;
initial begin clk =1'b1; forever #5 clk = !clk; end 
initial fork #1 reset = 1'b0; #7 reset = 1'b1;$dumpfile("dump.vcd");$dumpvars(0,test); join
endmodule