module LAB3_2 (out,in,sel,en);
    output out;
    input [3:0] in;
    input [1:0] sel;
    input en; 
    //用4個三態閘實現4選1多工器
    wire [3:0] W;
    wire [3:0] W2;
    decoder_2to4 D1(.Y_2(W),.sel(sel),.en(en));
    three_state_buffer T1(.Y(out),.A(in[0]),.EN(W[0]));
    three_state_buffer T2(.Y(out),.A(in[1]),.EN(W[1]));
    three_state_buffer T3(.Y(out),.A(in[2]),.EN(W[2]));
    three_state_buffer T4(.Y(out),.A(in[3]),.EN(W[3]));
endmodule 


module three_state_buffer(Y,A,EN);
    output reg Y;
    input A,EN;
    always @(A,EN) begin
        if (EN) Y = A;
        else Y = 1'bz; // high impedance state
    end
endmodule 

module decoder_2to4 (Y_2,sel,en);
    output reg [3:0] Y_2;
    input [1:0] sel;
    input en;
    
    always @(en,sel) begin
        if (en) begin
            case (sel)
                2'b00: Y_2 = 4'b0001;
                2'b01: Y_2 = 4'b0010;
                2'b10: Y_2 = 4'b0100;
                2'b11: Y_2 = 4'b1000;
                default: Y_2 = 4'b0000;
            endcase
        end
        else Y_2 = 4'b0000;
    end
endmodule