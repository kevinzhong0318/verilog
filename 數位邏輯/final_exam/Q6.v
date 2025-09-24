module Question6(output reg [7:0] count,input reset,clk);
reg [3:0] state;
always@(posedge clk,negedge reset)
if(reset==1'b0) state<=0;else state<=state+1;
always@(state)
case(state)
0,2,4,6,8,10,12: count<=8'b00000001;
1: count<=8'b00000010;
3: count<=8'b00000100;
5: count<=8'b00001000;
7: count<=8'b00010000;
9: count<=8'b00100000;
11: count<=8'b01000000;
13: count<=8'b10000000;
default : count<=8'b00000000;
endcase
endmodule
module test();
wire [7:0]count;
reg clk,reset;
Question6 M0(count,reset,clk);
initial #200 $finish;
initial begin clk=1'b0; forever  #5clk=!clk; end
initial begin reset = 0; #2 reset = 1; $dumpfile("dump.vcd");$dumpvars(0,test);end 
endmodule