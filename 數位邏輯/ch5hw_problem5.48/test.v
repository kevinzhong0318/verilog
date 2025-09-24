module problem(y,x,clk,reset); 
input x,clk,reset; 
output reg y; 
reg[1:0]    state,next_state; 
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11; 
always@(posedge clk,negedge reset)begin 
if(reset==0) 
state<=s0; 
else
state<= next_state; 
case(state) 
s0: if(x)next_state<=s1;else next_state<=s2; 
s1: if(x)next_state<=s3;else next_state<=s2; 
s2: if(x)next_state<=s3;else next_state<=s1; 
s3: if(x)next_state<= s0;else next_state<=s2; 
endcase 
case(state) 
s0: y<=x; 
s1: y<=x;
s2: y<=x; 
s3: y<=!x; 
endcase 
end 
endmodule 
module test1_Problem5_48; 
wire y; 
reg x,clk,Reset; 
problem M0(y,x,clk,Reset); 
initial begin 
    clk=0; 
    forever#5clk=!clk; 
end 
initial fork 
    #0 Reset=0; 
    #30 Reset=1; 
    #100 Reset=0; 
    #110 Reset=1; 
    #175 Reset=0; 
    #185 Reset=1; 
    #30 x=0;
    #90 x=1; 
    #140 x=0; 
    #170 x=1; 
    $dumpfile("problem5_48.vcd");
    $dumpvars(0,test1_Problem5_48);
join 
initial #200$finish; 
endmodule