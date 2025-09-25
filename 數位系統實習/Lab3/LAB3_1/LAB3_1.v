module LAB3_1(out,sel,in);
    // 32x1多工器
    input [31:0] in;
    input [4:0] sel;
    output out;
    reg out;

    integer i;

    always @(*)
    begin
        for (i=0;i<32;i=i+1)
        begin
            if (sel==i)
                out = in[i];
        end
        //out = in[sel];
    end
endmodule