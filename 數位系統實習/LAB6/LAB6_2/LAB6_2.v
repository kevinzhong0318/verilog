// Switch-Tail Ring Counter
module LAB6_2 (
    input clk,
    output wire    x,
    output reg  y, z
);
    reg Q1,Q2,Q3,Q4;

    initial begin
        {Q1,Q2,Q3,Q4} = 4'b0000;
        y=0; z=1;
    end
    always @(posedge clk) begin
        {Q1, Q2, Q3, Q4} <= {~Q4,Q1,Q2,Q3};
    end
    always @(posedge Q1,posedge Q3,clk) begin
        if (Q1&&~Q3) y <= 1'b1;
        else if (Q1&&Q3)y <= 1'b0;
    end
    always @(posedge Q3,negedge Q2,clk) begin
        if (~Q2&&Q3) z <= 1'b1;
        else if (Q3)z <= 1'b0;
    end
    assign x = Q2;
endmodule