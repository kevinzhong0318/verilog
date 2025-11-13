
module t_lab4 ();
    wire Clr_P2_P1_P0,Ld_regs,Ld_R0;
    reg EN,Ld,clk,rst;
    Three_Stage_Pipeline_register_controller UUT (
        .Clr_P2_P1_P0(Clr_P2_P1_P0),
        .Ld_regs(Ld_regs),
        .Ld_R0(Ld_R0),
        .EN(EN),
        .Ld(Ld),
        .clk(clk),
        .rst(rst)
    );
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst = 1; EN = 0; Ld = 0;
        #10 rst = 0;
        #10 EN = 1; Ld = 0;
        #10 EN = 1; Ld = 0;
        #10 EN = 1; Ld = 0;
        #10 EN = 1; Ld = 1;
        #30 EN = 1; Ld = 0;
        #10 EN = 0; Ld = 1;
        #20 EN = 1; Ld = 1;
        #10 EN = 0; Ld = 1;
    end
    initial #200 $finish;
endmodule //t_lab4