module problem5_60(Clock,Reset,Count);
input Count,Clock,Reset;
reg [3:0] state;
parameter  S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100,
S5=4'b0101,S6=4'b0110,S7=4'b0111,S8=4'b1000,S9=4'b1001 ;
always @(posedge Clock,negedge Reset) begin
if(Reset==0)
state<=S0;
else
case (state)
S0: if(Count)state<=S1;else state<=S0;
S1: if(Count)state<=S2;else state<=S1;
S2: if(Count)state<=S3;else state<=S2;
S3: if(Count)state<=S4;else state<=S3;
S4: if(Count)state<=S5;else state<=S4;
S5: if(Count)state<=S6;else state<=S5;
S6: if(Count)state<=S7;else state<=S6; 
S7: if(Count)state<=S8;else state<=S7;
S8: if(Count)state<=S9;else state<=S8;        
S9: if(Count)state<=S0;else state<=S9; 
endcase    
end
endmodule
module test_Problem5_60;
reg t_Count,t_Clock,t_Reset;
problem5_60 M0(t_Clock,t_Reset,t_Count);
initial begin
    t_Clock=0;
    forever#5t_Clock=!t_Clock;
end
initial fork
#0 t_Reset=0;
#40 t_Reset=1; 
#80 t_Reset=0;
#120 t_Reset=1;
#0 t_Count=1;
#30 t_Count=0;
#50 t_Count=1;
#100 t_Count=0;
#130 t_Count=1;
$dumpfile("problem5.60.vcd");
$dumpvars(0,test_Problem5_60);
join
initial #200$finish;
endmodule