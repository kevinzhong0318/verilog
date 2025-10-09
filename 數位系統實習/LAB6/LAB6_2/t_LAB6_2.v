`include "數位系統實習/LAB6/LAB6_2/LAB6_2.v"
`timescale 1ps / 1ps


module
t_LAB6_2;
    reg clk;
    wire x,y,z;

    LAB6_2 UUT (
        .clk(clk),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        clk = 0;
        forever #5000 clk = ~clk; // 1ns clock period
    end

    initial begin
        $dumpfile("t_LAB6_2.vcd");
        $dumpvars(0, t_LAB6_2);
        #240000; // Run the simulation for 400us
        $finish;
    end
endmodule //t_LAB6_2