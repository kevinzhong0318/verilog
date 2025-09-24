module BCDcounter(output A3,A2,A1,A0,input clk,reset_b);
    nand(w0,A3,A1);
    and(w1,reset_b,w0);
    TFF M0(A0,1,clk,w1);
    TFF M1(A1,1,!A0,w1);
    TFF M2(A2,1,!A1,w1);
    TFF M3(A3,1,!A2,w1);
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
    BCDcounter M0(A[3],A[2],A[1],A[0],clk,reset_b);
    initial #300 $finish;
    initial begin clk<=1'b0;forever #5 clk<=!clk; end
    initial fork 
        reset_b<=1'b0;
        #10reset_b<=1'b1;
        #30reset_b<=1'b0;
        #50reset_b<=1'b1;
        #70reset_b<=1'b0;
        #80reset_b<=1'b1;
        $dumpfile("dumpfile");
        $dumpvars(0,test);
    join
endmodule