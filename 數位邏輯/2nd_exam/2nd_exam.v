module exam6(output  A3,A2,A1,A0,input Up,Down,clk,reset);
    and(w1,!Up,Down);
    or(w2,Up,w1);
    TFF M0(A0,w2,clk,reset);
    and(w3,!A0,w1);
    and(w4,A0,Up);
    or(w5,w3,w4);
    TFF M1(A1,w5,clk,reset);
    and(w6,!A1,w3);
    and(w7,A1,w4);
    or(w8,w6,w7);
    TFF M2(A2,w8,clk,reset);
    and(w9,!A2,w6);
    and(w10,A2,w7);
    or(w11,w9,w10);
    TFF M3(A3,w11,clk,reset);
endmodule
module TFF(output reg Q,input T,clk,reset);
    always@(posedge clk,negedge reset)
    if(reset==1'b0)
    Q<=1'b0; else 
    case (T)
    1'b1:
    Q<=!Q;
    1'b0:
    Q<=Q;    
endcase
endmodule
module test();
wire B0,B1,B2,B3;
reg Up,Down,clk,reset;
wire [3:0]A={B3,B2,B1,B0};
exam6 M0(B3,B2,B1,B0,Up,Down,clk,reset);
initial #300 $finish; 
initial begin clk=1'b1;forever #5 clk=~clk; end
initial fork #10 reset=1'b0; #20 reset=1'b1; join
initial fork Down=1'b0; Up =1'b0; #40 Up=1'b1; #150 Down=1'b1; #200 Up=1'b0; #250 Down=1'b0;
$dumpfile("exam.vcd");
$dumpvars(0,test); 
join
endmodule