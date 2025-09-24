module shiftregister(output A3,A2,A1,A0,input clk,clear,I3,I2,I1,I0,shift_right,shift_left,S0,S1);
DFF M0(A3,y3,clk,clear);
DFF M1(A2,y2,clk,clear);
DFF M2(A1,y1,clk,clear);
DFF M3(A0,y0,clk,clear);
MUX4x1 M4(y3,S0,S1,I3,A2,shift_right,A3);
MUX4x1 M5(y2,S0,S1,I2,A1,A3,A2);
MUX4x1 M6(y1,S0,S1,I1,A0,A2,A1);
MUX4x1 M7(y0,S0,S1,I0,shift_left,A1,A0);
endmodule
module DFF(output reg Q,input D,clock,clear);
always@(posedge clock,negedge clear)
if(clear==1'b0)
Q<=0;else Q<=D;
endmodule
module MUX4x1(output reg y,input S0,S1,I3,I2,I1,I0);
always@(S0,S1,I3,I2,I1,I0)
case({S0,S1})
2'b00: y<=I0;
2'b01: y<=I1; 
2'b10: y<=I2; 
2'b11: y<=I3; 
endcase
endmodule
module t_shiftregister();
wire [3:0] A_par;
reg [3: 0] In_par;
reg MSB_in, LSB_in;
reg [1:0] s;
reg CLK, Clear_b;
shiftregister M0(A_par[3],A_par[2],A_par[1],A_par[0],CLK, Clear_b, In_par[3],In_par[2],In_par[1],In_par[0],MSB_in, LSB_in,s[0],s[1]);
initial #300 $finish;
initial begin CLK = 0; forever #5 CLK = !CLK; end
initial fork
Clear_b = 0; // Power-up initialization
In_par = 4'b1010; // Word for parallel load; 1010=A
MSB_in = 1'b1; // Bit for serial load
LSB_in = 1'b0; // Bit for serial load
s[1] = 0; s[0] = 0; // Initial action to no change
//
#20 Clear_b = 1; // Running
#40 begin s[1] = 1; s[0] = 1; end // parallel load
#60 Clear_b = 1'b0; // Reset on-the-fly
#80 Clear_b = 1'b1; // Resume action with parallel load at next clock edge
#90 begin s[1] = 0; s[0] = 0; end // No action ¡V register holds 4'b1010
#120 Clear_b = 1'b0; // Clear register
#130 Clear_b = 1'b1;
#140 begin s[1] = 1'b0; s[0] = 1'b1; end // Shifting to right (from MSB)
#170 begin s[1] = 1'b0; s[0] = 1'b0; end // Register should hold 4'b1111
#190 begin Clear_b = 1'b0; s[1] = 1'b0; s[0] = 1'b0; end
#200 begin Clear_b = 1'b1; s[1] = 1'b1; s[0]= 1'b0; end // Resume action ¡V shift left
#230 begin s[1] = 1'b0; s[0] = 1'b0; end
$dumpfile("dump.vcd");
$dumpvars(0,t_shiftregister);
join
endmodule