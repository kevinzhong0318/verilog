module t_lab2 ();
reg clk;
reg [7:0] accum,data;
reg [2:0] opcode;
wire [7:0] alu_out;
lab1_2 U_lab1_2 (
    .clk(clk),
    .accum(accum),
    .data(data),
    .opcode(opcode),
    .alu_out(alu_out)
);

initial begin 
    #1000 $finish;
end

//clk
initial begin
    clk=0;
    forever #5clk=~clk;
end
//counter
initial begin
    accum=8'b0;
    data=8'b0;
    opcode=3'b0;
    forever #10 begin
        accum=accum+3;
        data=data+5;
        opcode=opcode+3'b1;
    end
end

endmodule //t_lab2