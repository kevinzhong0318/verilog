module Latch_Seven_Seg_Display #(
    parameter ZERO=7'b000_0001,
    parameter ONE=7'b100_1111,
    parameter TWO=7'b001_0010,
    parameter THREE=7'b000_0110,
    parameter FOUR=7'b100_1100,
    parameter FIVE=7'b010_0100,
    parameter SIX=7'b010_0000,
    parameter SEVEN=7'b000_1111,
    parameter EIGHT=7'b000_0000,
    parameter NINE=7'b000_0100,
    parameter BLANK=7'b111_1111
)(
    output reg [6:0] Display_L,Display_R,
    input  Blanking,Enable,clock,reset
);

    reg [3:0] count;
    always@(posedge clock,reset,Enable)
    begin
        if(reset)
            count<=4'b0;
        else if(Enable)
            count<=count+4'b1;
        else
            count<=count;
    end

    always@(count,Blanking)
    begin
        if(Blanking) begin
            Display_L=BLANK;
            Display_R=BLANK;
        end
        else begin
            case(count)
                0:begin
                    Display_L=ZERO;
                    Display_R=ZERO;
                end
                2:begin
                    Display_L=ZERO;
                    Display_R=TWO;
                end
                4:begin
                    Display_L=ZERO;
                    Display_R=FOUR;
                end
                6:begin
                    Display_L=ZERO;
                    Display_R=SIX;
                end
                8:begin
                    Display_L=ZERO;
                    Display_R=EIGHT;
                end
                10:begin
                    Display_L=ONE;
                    Display_R=ZERO;
                end
                12:begin
                    Display_L=ONE;
                    Display_R=TWO;
                end
                14:begin
                    Display_L=ONE;
                    Display_R=FOUR;
                end
                // default:begin
                //     Display_L=BLANK;
                //     Display_R=BLANK;
                // end
            endcase
        end
    end
endmodule //Latch_Seven_Seg_Display