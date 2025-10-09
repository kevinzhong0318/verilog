`include "數位系統實習/LAB6/LAB6_1/LAB6_1.v"
`timescale 1ps/1ps


module t_LAB6_1;
    
    reg clk;
    reg [7:0] in;
    reg [1:0] sel;
    // wires                                               
    wire [7:0] out;

    // assign statements (if any)                          
    LAB6_1 i1 (
    // port map - connection between master ports and signals/registers   
        .clk(clk),
        .in(in),
        .out(out),
        .sel(sel)
    );
    initial 

    begin 
    #200000 $finish;
    end 

    // clk
    always
    begin
        clk = 1'b0;
        clk = #10000 1'b1;
        #10000;
    end 
    // in[ 7 ]
    initial
    begin
        in[7] = 1'b0;
        in[7] = #40000 1'b1;
    end 
    // in[ 6 ]
    initial
    begin
        in[6] = 1'b0;
    end 
    // in[ 5 ]
    initial
    begin
        in[5] = 1'b0;
        in[5] = #40000 1'b1;
    end 
    // in[ 4 ]
    initial
    begin
        in[4] = 1'b0;
        in[4] = #40000 1'b1;
    end 
    // in[ 3 ]
    initial
    begin
        in[3] = 1'b0;
        in[3] = #40000 1'b1;
    end 
    // in[ 2 ]
    initial
    begin
        in[2] = 1'b0;
    end 
    // in[ 1 ]
    initial
    begin
        in[1] = 1'b0;
        in[1] = #40000 1'b1;
    end 
    // in[ 0 ]
    initial
    begin
        in[0] = 1'b0;
    end 
    // sel[ 1 ]
    initial
    begin
        sel[1] = 1'b0;
        sel[1] = #60000 1'b1;
        sel[1] = #20000 1'b0;
        sel[1] = #20000 1'b1;
        sel[1] = #20000 1'b0;
    end 
    // sel[ 0 ]
    initial
    begin
        sel[0] = 1'b0;
        sel[0] = #60000 1'b1;
        sel[0] = #20000 1'b0;
        sel[0] = #80000 1'b1;
        sel[0] = #20000 1'b0;
    end 

    initial begin
        $dumpfile("LAB6_1.vcd");
        $dumpvars(0, t_LAB6_1);
    end

endmodule