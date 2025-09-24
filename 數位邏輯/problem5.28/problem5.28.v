// 
/*module problem5_28(output A,input x,y,clk,reset);
TFF M0(A,w1,clk,reset);
xor(w1,x,y);
endmodule
module TFF(output reg Q,input T,clk,reset);
always@(posedge clk,negedge reset)
if(reset==1'b0)Q<=1'b0;else
case(T)
1'b0: Q<=Q;
1'b1: Q<=!Q;
endcase
endmodule*/
module problem5_28(output reg A,input x,y,clk,reset);
parameter S0=1'b0,S1=1'b1;
xor(w1,x,y);
always@(posedge clk,negedge reset)
if(reset==1'b0)A<=S0;else
case(A)
1'b0: if(w1==1'b0)A<=S0;else A<=S1;
1'b1: if(w1==1'b0)A<=S1;else A<=S0;
endcase
endmodule
module problem5_28_test();
reg x,y,clk,reset;
wire A;
problem5_28 M0(A,x,y,clk,reset);
initial begin clk=1'b0;forever #5 clk=!clk;end
initial fork
#200$finish;
reset=1'b0;
#10 reset=1'b1;
#140 reset=1'b0;
#160 reset=1'b1;
x=1'b0;
#10x=1'b1;
#50x=1'b0;
y=1'b0;
#20y=1'b1;
#70y=1'b0;
#170y=1'b1;
$dumpfile("dump.vcd");
$dumpvars(0,problem5_28_test);
join
endmodule