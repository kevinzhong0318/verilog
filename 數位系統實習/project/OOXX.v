module OOXX#(
    parameter WIDTH = 16,
    parameter board_color = 16'hFFFF,
    parameter X_row1 =4'b1001,
    parameter X_row2 =4'b0110,//1221
    parameter O_row1 =4'b0110,
    parameter O_row2 =4'b1001,//1221,
    parameter Press_1=7'b0111011,
    parameter Press_2=7'b0111101,
    parameter Press_3=7'b0111110,
    parameter Press_4=7'b1011011,
    parameter Press_5=7'b1011101,
    parameter Press_6=7'b1011110,
    parameter Press_7=7'b1101011,
    parameter Press_8=7'b1101101,
    parameter Press_9=7'b1101110
)(  
    input clk,reset,
    
    input [0:3]X_Small_key_Pad_Row,
    input [0:2]X_Small_key_Pad_Col,
    input [0:3]O_Small_key_Pad_Row,
    input [0:2]O_Small_key_Pad_Col,

    output reg [0:WIDTH-1] display_col,
    output reg [WIDTH-1:0] display_row,

    //judge win
    reg [8:0]O_display,
    reg [8:0]X_display,

    //7segment display
    reg [3:0]Owin,
    reg [3:0]Xwin,
    output reg [6:0] seg1,
    output reg [6:0] seg2,
    output reg [6:0] seg3,
    output reg [6:0] seg4,

    //LCDM
    output	reg [7:0]	LCD_DATA,
    output	reg LCD_RW,
    output	reg LCD_EN,
    output	reg LCD_RS,
    output	reg LCD_RST
);
    reg [4:0] state;
    reg [3:0]turn;
    reg [0:WIDTH-1] col_reg [0:15];
    reg [WIDTH-1:0] row_reg [0:15];
    integer i,j;

    //LCDM setting
    reg		[3:0]	LCDM_state;
    reg		[17:0]	LCDM_counter;
    reg		[5:0]	DATA_INDEX;
    wire    [7:0]	DATA;

    LCDM_table	M1(DATA_INDEX,DATA);

    initial begin
        state =5'b00001;
        turn=4'b0001;
        for(i = 0; i < 16; i = i + 1) begin
            // if(i ==4 || i == 5 || i == 10 || i == 11)
            //     //col_reg[i] = board_color;
            //     col_reg[i] = 16'b0000000000000000;
            // else
                col_reg[i] = 16'b0000000000000000;
            row_reg[i] = 16'b0000000000000001 << i; 
        end
    end
    always @(posedge clk/*,negedge reset*/) begin
        if(reset) begin
            state <= 5'b00000;
            turn <= 4'b0001;
            for(i = 0; i < 16; i = i + 1) begin
            // if(i ==4 || i == 5 || i == 10 || i == 11)
            //     col_reg[i] = board_color;
            //     //col_reg[i] = 16'b0000000000000000;
            // else
            //     col_reg[i] = 16'b0000110000110000;
                col_reg[i] = 16'b0000000000000000;
                row_reg[i] = 16'b0000000000000001 << i; 
        end
        //LCDM setting
            case(LCDM_state)
                //select state
                4'd0:begin
                    if(DATA_INDEX == 6'd32)
                        LCDM_state	<= 4'd4;
                    else if(DATA_INDEX == 6'd63)
                        LCDM_state	<= 4'd5;
                    else begin
                        LCDM_state	<= 4'd1;
                    end
                    LCD_RST		<= 1'b0;
                end
                // set RS,EN,RW,DATA
                4'd1:begin
                    LCD_EN	<= 1'b1;
                    LCD_RS	<= 1'b1;
                    LCD_RW	<= 1'b0;
                    LCD_RST	<= 1'b0;
                    LCD_DATA <= DATA[7:0];
                    LCDM_state		<= 4'd2;
                end
                // delay
                4'd2:begin
                    if(LCDM_counter	< 18'd1)//
                        LCDM_counter	<= LCDM_counter+18'd1;
                    else
                        LCDM_state		<= 4'd3;
                end
                4'd3:begin
                    LCD_EN	<= 1'b0;
                    LCDM_counter	<= 18'd0;	
                    DATA_INDEX		<= DATA_INDEX+6'd1;
                    LCDM_state		<= 4'd0;
                end
                // wating for clear button
                /*4'd4:begin
                    if(!clear)begin
                        LCDM_state		<= 4'd1;
                        LCD_RST		<= 1'b1;
                    end
                    else LCDM_state	<= 4'd4;
                end*/
                4'd5:begin //finish
                    LCDM_state	<= 4'd5;
                end
                default:;
            endcase
        end
        else begin
            //LCDM signal
            LCD_DATA	<= 8'd0;
            LCD_RW	<= 1'b1;
            LCD_EN	<= 1'b1;
            LCD_RS	<= 1'b0;
            LCDM_state		<= 4'd0;
            LCDM_counter	<= 18'd0;
            DATA_INDEX	<= 6'd0;
            LCD_RST		<= 1'b1;
            //judge press
            if (turn%2==0)begin
                case ({X_Small_key_Pad_Row,X_Small_key_Pad_Col})
                Press_1:
                begin
                    turn<=turn+1;
                    col_reg[0][0:3]<=X_row1;
                    col_reg[1][0:3]<=X_row2;
                    col_reg[2][0:3]<=X_row2;
                    col_reg[3][0:3]<=X_row1;
                    
                end
                Press_2:
                begin
                    turn<=turn+1;
                    col_reg[0][6:9]<=X_row1;
                    col_reg[1][6:9]<=X_row2;
                    col_reg[2][6:9]<=X_row2;
                    col_reg[3][6:9]<=X_row1;
                    
                end
                Press_3:
                begin
                    turn<=turn+1;
                    col_reg[0][12:15]<=X_row1;
                    col_reg[1][12:15]<=X_row2;
                    col_reg[2][12:15]<=X_row2;
                    col_reg[3][12:15]<=X_row1;
                    
                end
                Press_4:
                begin
                    turn<=turn+1;
                    col_reg[6][0:3]<=X_row1;
                    col_reg[7][0:3]<=X_row2;
                    col_reg[8][0:3]<=X_row2;
                    col_reg[9][0:3]<=X_row1;
                    
                end
                Press_5:
                begin
                    turn<=turn+1;
                    col_reg[6][6:9]<=X_row1;
                    col_reg[7][6:9]<=X_row2;
                    col_reg[8][6:9]<=X_row2;
                    col_reg[9][6:9]<=X_row1;
                    
                end 
                Press_6:
                begin
                    turn<=turn+1;
                    col_reg[6][12:15]<=X_row1;
                    col_reg[7][12:15]<=X_row2;
                    col_reg[8][12:15]<=X_row2;
                    col_reg[9][12:15]<=X_row1;
                    
                end
                Press_7:
                begin
                    turn<=turn+1;
                    col_reg[12][0:3]<=X_row1;
                    col_reg[13][0:3]<=X_row2;
                    col_reg[14][0:3]<=X_row2;
                    col_reg[15][0:3]<=X_row1;
                    
                end
                Press_8:
                begin
                    turn<=turn+1;
                    col_reg[12][6:9]<=X_row1;
                    col_reg[13][6:9]<=X_row2;
                    col_reg[14][6:9]<=X_row2;
                    col_reg[15][6:9]<=X_row1;
                    
                end
                Press_9:
                begin
                    turn<=turn+1;
                    col_reg[12][12:15]<=X_row1;
                    col_reg[13][12:15]<=X_row2;
                    col_reg[14][12:15]<=X_row2;
                    col_reg[15][12:15]<=X_row1;
                    
                end
                
                default: 
                begin
                    //col_reg[0]<={X_row1,12'b110000110000};
                    //col_reg[1]<={X_row2,12'b110000110000};
                    //col_reg[2]<={X_row2,12'b110000110000};
                    //col_reg[3]<={X_row1,12'b110000110000};
                end
                endcase
            end else begin
                case ({O_Small_key_Pad_Row,O_Small_key_Pad_Col})
                Press_1:
                begin
                    turn<=turn+1;
                    col_reg[0][0:3]<=O_row1;
                    col_reg[1][0:3]<=O_row2;
                    col_reg[2][0:3]<=O_row2;
                    col_reg[3][0:3]<=O_row1;
                    
                end
                Press_2:
                begin
                    turn<=turn+1;
                    col_reg[0][6:9]<=O_row1;
                    col_reg[1][6:9]<=O_row2;
                    col_reg[2][6:9]<=O_row2;
                    col_reg[3][6:9]<=O_row1;
                    
                end
                Press_3:
                begin
                    turn<=turn+1;
                    col_reg[0][12:15]<=O_row1;
                    col_reg[1][12:15]<=O_row2;
                    col_reg[2][12:15]<=O_row2;
                    col_reg[3][12:15]<=O_row1;
                    
                end
                Press_4:
                begin
                    turn<=turn+1;
                    col_reg[6][0:3]<=O_row1;
                    col_reg[7][0:3]<=O_row2;
                    col_reg[8][0:3]<=O_row2;
                    col_reg[9][0:3]<=O_row1;
                    
                end
                Press_5:
                begin
                    turn<=turn+1;
                    col_reg[6][6:9]<=O_row1;
                    col_reg[7][6:9]<=O_row2;
                    col_reg[8][6:9]<=O_row2;
                    col_reg[9][6:9]<=O_row1;
                    
                end 
                Press_6:
                begin
                    turn<=turn+1;
                    col_reg[6][12:15]<=O_row1;
                    col_reg[7][12:15]<=O_row2;
                    col_reg[8][12:15]<=O_row2;
                    col_reg[9][12:15]<=O_row1;
                    
                end
                Press_7:
                begin
                    turn<=turn+1;
                    col_reg[12][0:3]<=O_row1;
                    col_reg[13][0:3]<=O_row2;
                    col_reg[14][0:3]<=O_row2;
                    col_reg[15][0:3]<=O_row1;
                    
                end
                Press_8:
                begin
                    turn<=turn+1;
                    col_reg[12][6:9]<=O_row1;
                    col_reg[13][6:9]<=O_row2;
                    col_reg[14][6:9]<=O_row2;
                    col_reg[15][6:9]<=O_row1;
                    
                end
                Press_9:
                begin
                    turn<=turn+1;
                    col_reg[12][12:15]<=O_row1;
                    col_reg[13][12:15]<=O_row2;
                    col_reg[14][12:15]<=O_row2;
                    col_reg[15][12:15]<=O_row1;
                    
                end
                
                default: 
                begin
                    //col_reg[0]<={X_row1,12'b110000110000};
                    //col_reg[1]<={X_row2,12'b110000110000};
                    //col_reg[2]<={X_row2,12'b110000110000};
                    //col_reg[3]<={X_row1,12'b110000110000};
                end
                endcase
            end
            if(state==5'b10000)begin state<=5'b00001; end
            else begin state <= state + 1;end//1~16
        end
    end
    always @(*) begin
		
        display_col = 0;
        display_row = 0;

        if(state)begin
            for (j = 0; j < 16; j = j + 1) begin
            if(j == state-1) begin
                display_col = col_reg[j];
                display_row = row_reg[j];
            end//display board
            end
        end else begin
			for (j = 0; j < 16; j = j + 1) begin
                display_col = 0;
                display_row = row_reg[j];
            end
        end
        
    end
endmodule


module	LCDM_table(table_index,data_out);
input		[5:0]table_index;
output	reg	[7:0]data_out;

always@(table_index)begin
	case(table_index)
		//display 1st page
		6'd0: data_out = 8'h32; // first row 
		6'd1: data_out = 8'h45; 
		6'd2: data_out = 8'h53;
		6'd3: data_out = 8'h54;
		6'd4: data_out = 8'h5F;
		6'd5: data_out = 8'h54;
		6'd6: data_out = 8'h48;
		6'd7: data_out = 8'h45;
		6'd8: data_out = 8'h5F;
		6'd9: data_out = 8'h42;
		6'd10: data_out = 8'h4F;
		6'd11: data_out = 8'h41;
		6'd12: data_out = 8'h44;
		6'd13: data_out = 8'h01;
		6'd14: data_out = 8'h01;
		6'd15: data_out = 8'h5F;
		6'd16: data_out = 8'h37; // second row
		6'd17: data_out = 8'h49;
		6'd18: data_out = 8'h4E;
		6'd19: data_out = 8'h4E;
		6'd20: data_out = 8'h45;
		6'd21: data_out = 8'h52;
		6'd22: data_out = 8'h5F;
		6'd23: data_out = 8'h49;
		6'd24: data_out = 8'h53;
		6'd25: data_out = 8'h5F;
		6'd26: data_out = 8'h2F;
		6'd27: data_out = 8'h01;
		6'd28: data_out = 8'h01;
		6'd29: data_out = 8'h5F;
		6'd30: data_out = 8'h5F;
		6'd31: data_out = 8'h5F; // finish	
		//display 2nd page
		6'd32: data_out = 8'h22;
		6'd33: data_out = 8'h11;
		6'd34: data_out = 8'h11;
		6'd35: data_out = 8'h11;		
		6'd36: data_out = 8'h10;
		6'd37: data_out = 8'h17;
		6'd38: data_out = 8'h11;
		6'd39: data_out = 8'h14;
		6'd40: data_out = 8'h17;
		6'd41: data_out = 8'h5F;//space char
		6'd42: data_out = 8'h5F;
		6'd43: data_out = 8'h5F;
		6'd44: data_out = 8'h5F;
		6'd45: data_out = 8'h5F;
		6'd46: data_out = 8'h5F;
		6'd47: data_out = 8'h5F;
		6'd48: data_out = 8'h5F;
		6'd49: data_out = 8'h5F;
		6'd50: data_out = 8'h5F;
		6'd51: data_out = 8'h5F;
		default:data_out = 8'h000;
	endcase
end

endmodule

/*module  trigger(clk,reset,sw_in,sw_out);
input   clk,sw_in,reset;
output  reg sw_out;
reg     tri_reg;

always@(posedge clk,negedge reset)begin
	if(!reset)begin
		sw_out <= 1'd0;
		tri_reg <= 1'd0;
	end
	else	begin
		if(sw_in == 1 && tri_reg == 0)sw_out <= 1'd1;
		else sw_out <= 1'd0;
		tri_reg <= sw_in;
	end
end  
endmodule*/