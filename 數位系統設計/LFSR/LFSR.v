module LFSR #(
    parameter length= 8,
    parameter [8:1] Tap_Coefficient  = 8'b1010_0101
)(
    output reg [1:8] Y,
    input clock, sel,
    input [1:8] initial_state 
);
    
    always@(posedge clock)
    begin
        if(sel)
            Y<=initial_state;
        else begin
            Y[1] <= Y[8];
            Y[2] <= Tap_Coefficient[7]? Y[1] ^ Y[8] : Y[1];
            Y[3] <= Tap_Coefficient[6]? Y[2] ^ Y[8] : Y[2];
            Y[4] <= Tap_Coefficient[5]? Y[3] ^ Y[8] : Y[3];
            Y[5] <= Tap_Coefficient[4]? Y[4] ^ Y[8] : Y[4];
            Y[6] <= Tap_Coefficient[3]? Y[5] ^ Y[8] : Y[5];
            Y[7] <= Tap_Coefficient[2]? Y[6] ^ Y[8] : Y[6];
            Y[8] <= Tap_Coefficient[1]? Y[7] ^ Y[8] : Y[7];
        end
    end

endmodule //LFSR