module LAB7_1 #(
    parameter s0 = 2'b00,
              s1 = 2'b01,
              s2 = 2'b10,
              s3 = 2'b11
)(
    input clk,
    input in,
    input rst,
    output reg out,
    output reg [1:0] out_state
);

reg [1:0] state;
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= s0;
        out <= 0;
        out_state <= s0;
    end
    else begin
        case (state)
            s0:
                //state<= in ? s1 : s0;
                if (in) begin
                    state <= s1;
                    out = 0;
                    out_state <= s1;
                end
                else begin
                    state <= s0;
                    out = 0;
                    out_state <= s0;
                end
            s1:
                //state<= in ? s3 : s0;
                if (in) begin
                    state <= s3;
                    out = 0;
                    out_state <= s3;
                end
                else begin
                    state <= s0;
                    out = 1;
                    out_state <= s0;
                end
            s2:
                //state<= in ? s2 : s0;
                if (in) begin
                    state <= s2;
                    out = 0;
                    out_state <= s2;
                end
                else begin
                    state <= s0;
                    out = 1;
                    out_state <= s0;
                end
            s3:
                //state<= in ? s2 : s0;
                if (in) begin
                    state <= s2;
                    out = 0;
                    out_state <= s2;
                end
                else begin
                    state <= s0;
                    out = 1;
                    out_state <= s0;
                end
        endcase
    end
end

endmodule