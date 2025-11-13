module Two_Stage_Pipeline_register #(
    parameter S_idle= 2'b00,S_1= 2'b01,S_full= 2'b10,S_wait= 2'b11
)(
 output reg Clr_P1_P0,LD_P1_P0,LD_R0,
 input EN,Ld,clk,rst   
);
    reg [1:0] state, next_state;
    always@(posedge clk )
    begin
        if(rst)
            begin
                Clr_P1_P0<= 1'b0;
            end
        else begin
            state<= next_state;
        end
    end
    always@(state or EN or Ld)
    begin
        case (state)
            S_idle:
                begin
                    if(EN)begin
                        next_state= S_1;
                        LD_P1_P0= 1'b1;                    
                    end
                    else begin
                        next_state= S_idle;
                    end
                end
            S_1:
                begin
                    next_state= S_full;
                    LD_P1_P0= 1'b0;
                end
            S_full:
                if(!Ld)begin
                    next_state=S_wait;
                end
                else begin
                    LD_R0= 1'b1;
                    if(EN)begin
                        next_state= S_1;
                        LD_P1_P0= 1'b1;
                    end
                    else begin
                        next_state= S_idle;
                        Clr_P1_P0= 1'b1;
                    end
                end
            S_wait:
                if(!Ld)next_state= S_wait;
                else begin
                    LD_R0= 1'b1;
                    if(EN)begin
                        next_state= S_1;
                        LD_P1_P0= 1'b1;
                    end
                    else begin
                        next_state= S_idle;
                        Clr_P1_P0= 1'b1;
                    end
                end
        endcase
    end

endmodule //Two_Stage_Pipeline_register