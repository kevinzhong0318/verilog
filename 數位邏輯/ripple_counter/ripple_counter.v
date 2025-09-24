module ripplecounter(output A3,A2,A1,A0,input clk,reset_b);
TFF M4(A0,1'b1,clk,reset_b);
TFF M5(A1,1'b1,!A0,reset_b);
TFF M6(A2,1'b1,!A1,reset_b);
TFF M7(A3,1'b1,!A2,reset_b);
endmodule
module TFF(output reg Q,input T,clk,reset_b);
always@(posedge clk,negedge reset_b)
if(reset_b==1'b0)
Q<=1'b0;else
begin
    case(T)
    1'b1:Q<=!Q;
    1'b0:Q<=Q;
    endcase
end
endmodule
module test();
wire [3:0]A;
reg clk,reset_b;
ripplecounter M0(A[3],A[2],A[1],A[0],clk,reset_b);
initial #300 $finish;
initial begin clk<=1'b0;forever #5 clk<=!clk; end
initial fork 
    reset_b<=1'b0;
    #10reset_b<=1'b1;
    $dumpfile("dumpfile");
    $dumpvars(0,test);
join

endmodule