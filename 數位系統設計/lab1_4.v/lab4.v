module Three_Stage_Pipeline_register_controller #(
    parameter S_idle= 3'b000,S_1= 3'b001,S_2=3'b010,S_full= 3'b011,S_wait= 3'b100
)(
 output reg Clr_P2_P1_P0,Ld_regs,Ld_R0,
 input EN,Ld,clk,rst   
);
    reg [2:0] state, next_state;
    always@(posedge clk )
    begin
        if(rst)begin
            Clr_P2_P1_P0<= 1'b1;
	    state<=S_idle;
        end
	else begin
            state<= next_state;
        end
    end
    always@(state,EN,Ld)
    begin
    Clr_P2_P1_P0= 1'b0;Ld_regs= 1'b0;Ld_R0= 1'b0;
        case (state)
            S_idle:
                begin
                    if(EN)begin
                        next_state= S_1;
                        Ld_regs= 1'b1;                    
                    end
                    else begin
                        next_state= S_idle;
			Clr_P2_P1_P0= 1'b1;
                    end
                end
            S_1:
                begin
                    next_state= S_2;
                    Ld_regs= 1'b1;
                end
            S_2:
                begin
                    next_state= S_full;
                    Ld_regs= 1'b1;
                end
            S_full:
                if(!Ld)begin
                    next_state=S_wait;
                end
                else begin
                    Ld_R0= 1'b1;
                    if(EN)begin
                        next_state= S_1;
                        Ld_regs= 1'b1;
                    end
                    else begin
                        next_state= S_idle;
                        Clr_P2_P1_P0= 1'b1;
                    end
                end
            S_wait:
                if(!Ld)next_state= S_wait;
                else begin
                    Ld_R0= 1'b1;
                    if(EN)begin
                        next_state= S_1;
                        Ld_regs= 1'b1;
                    end
                    else begin
                        next_state= S_idle;
                        Clr_P2_P1_P0= 1'b1;
                    end
                end
        endcase
    end

endmodule

// module Three_Stage_Pipeline_register_Datapath (
//     input clk,
//     input [7:0] Data,
//     input Ld_regs,Clr_P2_P1_P0,Ld,
//     output reg [23:0] R0
// );
//     reg [7:0] P0,P1,P2;
//     always@(posedge clk)
//     begin
//         if(Clr_P2_P1_P0)begin
//             P0<= 8'b0;
//             P1<= 8'b0;
//             P2<= 8'b0;
//         end
//         else if(Ld_regs)begin
//             P2<= Data;
//             P1<= P2;
//             P0<= P1;
//         end
//         else if(Ld)begin
//             R0<= {P2,P1,P0};
//         end
//     end
// endmodule