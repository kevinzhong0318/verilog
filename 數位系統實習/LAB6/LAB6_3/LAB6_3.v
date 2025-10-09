module LAB6_3(clear,clk,p_out1,p_out2,s_in,shift_ctrl);
input clear,clk,s_in,shift_ctrl;
output [3:0]p_out1,p_out2;
wire FA_C,FA_z,FA_S,x;

shift S1(.s_in(FA_S),.shift_ctrl(shift_ctrl),.clk(clk),.p_out(p_out1));
shift S2(.s_in(s_in),.shift_ctrl(shift_ctrl),.clk(clk),.p_out(p_out2));
FA F1(.A(p_out1[0]),.B(p_out2[0]),.C0(FA_z),.S(FA_S),.C(FA_C));
D_FF D0(x,clear,FA_C,FA_z);
assign x=clk&shift_ctrl;
endmodule
// (clk 正緣觸發；clear 負緣觸發)
module D_FF(clk,clear,D,Q);
input clear;
input clk,D;
output reg Q;
initial Q = 0;
always @(negedge clear or posedge clk)
    if(!clear) Q <= 0;
    else Q <= D;
endmodule
module FA(A, B, C0,S,C);
    input A, B, C0;
    output S, C;
    assign S = A ^ B ^ C0;
    assign C = (A & B) | (B & C0) | (C0 & A);
endmodule
module shift(s_in,shift_ctrl,clk,p_out);
input s_in;
input shift_ctrl,clk;
output reg [3:0] p_out;
initial p_out = 4'b0000;
always @(posedge clk)
    begin
        if(shift_ctrl) p_out <= {s_in,p_out[3:1]};
        else p_out <= p_out;
    end
endmodule