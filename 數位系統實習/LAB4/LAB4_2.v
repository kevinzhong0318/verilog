module LAB4_2 (J,K,CLK,reset,set,Q);
input J,K,CLK,reset,set;
output reg Q;

always@(negedge CLK)
begin
    if(reset)
        Q <= 1'b0;
    else if(set)
        Q <= 1'b1;
    else if(J==0 && K==0)
        Q <= Q;
    else if(J==0 && K==1)
        Q <= 1'b0;
    else if(J==1 && K==0)
        Q <= 1'b1;
    else if(J==1 && K==1)
        Q <= ~Q;
    else
        Q <= 1'bx;
end


endmodule //LAB4_2