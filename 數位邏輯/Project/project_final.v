module project(input CONV,input [9:0]Vpeak,output reset_signal);
    LMM311DR M1(.Vpeak(Vpeak),.LM311DR_signal(LM311DR_signal));
    wire LM311DR_signal;
    wire dff_clear,Dff_output;
    wire LM311DR_not;
    assign LM311DR_not = ~LM311DR_signal; // 反轉 LM311DR_signal
    and(reset_signal, LM311DR_not, Dff_output);
    nand(dff_clear,Dff_output,LM311DR_signal);
    Dff M0(.D(1'b1),.clk(CONV),.clear(dff_clear),.set(1'b1),.Q(Dff_output));
endmodule

module Dff(input D,clk,clear,set,output reg Q); //D flip-flop
    always@(posedge clk or negedge clear or negedge set)begin
    if (clear==1'b0 && set==1'b0)
        Q<=1'b1;
    else if  (set==1'b0)
        Q<=1'b1; //保持
    else if (clear==1'b0)
        Q<=1'b0; //清除
    else
        Q<=D; //維持原狀
    end
endmodule

module LMM311DR(input [9:0]Vpeak,output reg LM311DR_signal); //LM311DR(模塊)
    parameter Vref = 10'b0110001000; // 392 in decimal(差不多383mV)
    always@(*)begin
        if(Vpeak>Vref)
            LM311DR_signal=1'b0;
        else
            LM311DR_signal=1'b1;
    end
endmodule

//testbench
`timescale 1us/1ns //設定時間單位為微秒 (us)
module testbench();
    reg CONV;
    reg [9:0]Vpeak;//input
    wire reset_signal;//output
    project M2(CONV,Vpeak,reset_signal);
    initial #150 $finish; //模擬150us時間
    parameter HIGH_TIME = 1.39;   // 高電平時間 (us)
    parameter LOW_TIME  = 26.39; // 低電平時間 (us)
    // 36kHz clk
    initial begin 
        CONV=1'b0;//函數產生器CH2未開啟
        #40CONV=1'b1;//40us函數產生器CH2開啟
        forever begin
            #HIGH_TIME CONV=~CONV;
            #LOW_TIME CONV=~CONV;
        end
    end
    always @(reset_signal) begin
        if (reset_signal == 1'b1)
            #0.3Vpeak = 10'b0000000000; // 0V
    end
    initial fork
        #0Vpeak=10'b0000000000;
        #40Vpeak=10'b0010001000;
        #80Vpeak=10'b1110001100;
        #120Vpeak=10'b1010001000;
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench); //產生波形檔
    join   
endmodule