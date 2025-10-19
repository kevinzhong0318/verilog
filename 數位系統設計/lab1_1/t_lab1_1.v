`include "lab1_1/lab1_1.v"
`timescale 1us/1ns
module t_lab1_1 ();
    reg x,y,clk;
    wire z;
    lab1_1 U_lab1_1 (
        .x(x),
        .y(y),
        .clk(clk),
        .z(z)
    );
    initial begin
        clk=0;
        forever #5 clk=~clk; //10us clock period
    end
    initial begin
        #0;
        x=0;y=0;
        #20;
        x=0;y=1;
        #20;
        x=1;y=0;
        #20;
        x=1;y=1;
        #20;
        x=0;y=0;
        #20;
        x=0;y=1;
        #20;
        x=1;y=0;
        #20;
        x=1;y=1;
    end
    initial begin
        #160 $finish;
    end
    initial begin
        $dumpfile("t_lab1_1.vcd");
        $dumpvars(0,t_lab1_1);
    end
endmodule //t_lab1_1