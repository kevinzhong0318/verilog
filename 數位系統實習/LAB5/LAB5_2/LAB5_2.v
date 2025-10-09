module LAB5_2 (clk,fout,rst);
input clk,rst;
output reg fout;
reg [3:0] out;

initial begin
    out=4'b1010;
end

always @(posedge clk or negedge rst) begin
    if (rst==0)begin
        fout<=1'b0;
    end else if (out==1) begin
        fout<=~fout;
        out=4'b1010;
    end
     else out<=out-1;
end

endmodule //LAB5_2