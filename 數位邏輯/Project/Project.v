module project(input CONV,LM311DR_signal,output reset_signal);
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

//testbench
`timescale 1us/1ns //設定時間單位為微秒 (us)
module testbench();
    reg CONV,LM311DR_signal;//input
    wire reset_signal;//output
    project M1(CONV,LM311DR_signal,reset_signal);
    initial #150 $finish; //模擬100us時間
    parameter HIGH_TIME = 1.39;   // 高電平時間 (us)
    parameter LOW_TIME  = 26.39; // 低電平時間 (us)
    // 36kHz clk
    initial begin 
        CONV=1'b0;//函數產生器CH2未開啟
        #30CONV=1'b1;//30us函數產生器CH2開啟
        forever begin
            #HIGH_TIME CONV=~CONV;
            #LOW_TIME CONV=~CONV;
        end
    end
    initial fork
        #0LM311DR_signal=1'b1; //LM311DR_signal為高電平
        #50 LM311DR_signal=1'b0; //LM311DR_signal為低電平
        #100 LM311DR_signal=1'b1; //LM311DR_signal為高電平
        #130 LM311DR_signal=1'b0; //LM311DR_signal為低電平
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench); //產生波形檔
    join   
endmodule