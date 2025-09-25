module LAB5_1 (clear,clk,count,in,load,out);
input clear,clk,load,count;
input [3:0] in;
output reg [3:0] out;

always @(posedge clk or posedge clear)
begin
   if(clear==1'b1)
       out <= 4'b0000;
   else if(load==1'b1)
       out = in;
   else if(count==1'b1)
       out <= out+4'b0001;
	else
		 out<=out;
end

endmodule //LAB5_1