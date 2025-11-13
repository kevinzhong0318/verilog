`include "數位系統設計/Latch_Seven_Seg_Display/Latch_Seven_Seg_Display.v"
`timescale 1us/1ns
module t_Latched_Seven_Seg_Display ();
    wire [6: 0]Display_L, Display_R;
    reg Blanking, Enable, clock, reset;
    Latch_Seven_Seg_Display MO (Display_L, Display_R,Blanking, Enable, clock, reset);
    initial #350 $finish;
    initial begin clock = 0; forever #5 clock = ~clock; end
    initial fork
    reset = 1;
    #20 reset = 0;
    Blanking = 0;
    #200 Blanking = 1;
    #250 Blanking = 0;
    Enable = 0;
    #30 Enable = 1;
    #300 Enable = 0;
    join 
    initial begin
        $dumpfile("t_Latched_Seven_Seg_Display.vcd");
        $dumpvars(0, t_Latched_Seven_Seg_Display);
    end
endmodule