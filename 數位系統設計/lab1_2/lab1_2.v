module lab1_2 (
    input clk,
    input [7:0] accum,data,
    input [2:0] opcode,
    output reg [7:0] alu_out
);

initial begin
    alu_out=8'b0;
end

always@(posedge clk)begin
    case(opcode)
        3'b000:alu_out<=accum;//pass accum
        3'b001:alu_out<=accum+data;//add
        3'b010:alu_out<=accum-data;//sub
        3'b011:alu_out<=accum&data;//and
        3'b100:alu_out<=accum^data;//xor
        3'b101:alu_out<=~accum+1;//2's complement
        3'b110:alu_out<=accum*5+accum/8;//accum*5 + accum/8
        3'b111:alu_out<= (accum>=32) ? data:~data;//if (accum >>= 32), alu_out = data,else alu_out = 1 s complement of data
        default:alu_out<=8'bx;
    endcase
end

endmodule //lab1_2