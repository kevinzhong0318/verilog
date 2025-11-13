module t_LFSR (
    
);
    wire [1:8] Y;
    reg clock, sel;
    reg [1:8] initial_state;
    LFSR U_LFSR (
        .Y(Y),
        .clock(clock),
        .sel(sel),
        .initial_state(initial_state)
    );
    initial #210 $finish;
    initial begin clock = 0; forever #5 clock = ~clock; end
    initial begin
        initial_state = 8'b1101_0011;
        #55 initial_state = 8'b1011_0011;
        #55 initial_state = 8'b1101_0011;
        #55 initial_state = 8'b1011_0011;
    end
    initial begin
        sel = 1;
        #20 sel = 0;
        #35 sel = 1;
        #20 sel = 0;
        #35 sel = 1;
        #20 sel = 0;
    end
endmodule //t_LFSR