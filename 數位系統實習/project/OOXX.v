//16-bit diasplay module
module OOXX#(
    parameter WIDTH = 16,
    parameter board_color = 16'hFFFF
)(  
    input clk,reset
    output [WIDTH-1:0] display_col,
    output [WIDTH-1:0] display_row,
);
    reg [3:0] state;
    reg [WIDTH-1:0] col_reg [0:15];
    reg [WIDTH-1:0] row_reg [0:15];
    initial begin
        integer i;
        for(i = 0; i < 16; i = i + 1) begin
            if(i ==4 || i == 5 || i == 10 || i == 11)
                col_reg[i] = board_color;
            else
                col_reg[i] = 16'b0000110000110000;
            row_reg[i] = 16'b0000000000000001 << i; 
        end
    end
    always @(posedge clk) begin
        if(reset) begin
            state <= 4'b0000;
        end
        else begin
            state <= state + 1;
        end
    end
    always @(*) begin
        display_col = 0;
        display_row = 0;
        for (i = 0; i < 16; i = i + 1) begin
            if(i == state) begin
                display_col = col_reg[i];
                display_row = row_reg[i];
            end
        end
    end




endmodule

