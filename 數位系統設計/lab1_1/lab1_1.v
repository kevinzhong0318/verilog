module lab1_1 #(parameter s0=1'b0,s1=1'b1)(
    input x,y,clk,
    output  z
);
    //s0:X xor Y--->chage state
    //s1:X xor Y--->not chage state
    reg state;
    initial begin 
    state=0;
    end
    assign z= (state==s1) ? 1'b1:1'b0;
    always@(posedge clk)begin
        case(state)
            s0:begin
                state<= x ^ y ? s1:s0;
            end
            s1:begin
                state<= (x&~y||~x&~y) ? s1:s0;
            end
            default:
                state=1'bx;
        endcase
    end
    

endmodule //lab1_1