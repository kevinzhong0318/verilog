//8位元移位暫存器
module LAB6_1 (
    input clk,
    input [1:0] sel,
    input [7:0] in,
    output reg [7:0] out
);

    initial begin
        out = 8'b00000000;
    end

    always @(posedge clk) begin
        case (sel)
            2'b00: out <= in;              
            2'b01: out <= {3'b000, out[7:3]}; 
            2'b10: out <= {2'b00, out[7:2]}; 
            2'b11: out <= {1'b0, out[7:1]};              
            default: out <= 8'bxxxxxxx; 
        endcase
    end

endmodule //LAB6_1