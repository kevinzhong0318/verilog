module OOXX#(
    parameter WIDTH = 16,
    parameter board_color = 16'hFFFF,
    parameter X_row1 =4'b1001,
    parameter X_row2 =4'b0110,//1221
    parameter O_row1 =4'b0110,
    parameter O_row2 =4'b1001,//1221
)(  
    input clk,reset,
    output reg [WIDTH-1:0] display_col,
    output reg [WIDTH-1:0] display_row
);
    reg [3:0] state;
    reg [WIDTH-1:0] col_reg [0:15];
    reg [WIDTH-1:0] row_reg [0:15];
    integer i,j;
    initial begin
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
        for (j = 0; j < 16; j = j + 1) begin
            if(j == state) begin
                display_col = col_reg[j];
                display_row = row_reg[j];
            end
        end
    end




endmodule

