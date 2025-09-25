module LAB4_3 (D_in, clk, rst,load, D_out);
input [3:0] D_in;
input clk, rst, load;
output reg [3:0] D_out;

initial begin
    D_out = 4'b0000;
end // 設定初始值

always @(posedge clk) begin
    if (!rst) begin
        D_out <= 4'b0000;
    end
    else if (load) begin
        D_out <= D_in;
    end
    else begin
        D_out <= D_out; // Hold the value
    end
end
endmodule //LAB4_3