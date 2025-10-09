// Switch-Tail Ring Counter
module LAB6_2 (
    input clk,
    output  x, y, z
);
    reg Q1,Q2,Q3;//Q3給Z
    reg Q4,Q5,Q6,Q7;
    reg Q8,Q9;
    initial begin
        {Q1,Q2,Q3} = 3'b001;
        {Q4,Q5,Q6,Q7} = 4'b000;
        {Q8,Q9} = 2'b00;
    end
    always @(posedge clk) begin
        if (Q8) {Q1, Q2, Q3} <= 3'b001;
        else {Q1, Q2, Q3} <= {~Q3,Q1,Q2};
        
        {Q4,Q5,Q6,Q7} <= {~Q7,Q4,Q5,Q6};
        {Q8,Q9} <= {~Q9,Q8};
    end
    assign z = ~Q2;
    assign y = (~Q7)? Q8:1'b0;
    assign x = Q5;
endmodule