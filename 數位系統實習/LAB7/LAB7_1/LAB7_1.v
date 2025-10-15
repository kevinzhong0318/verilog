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

    reg [1:0] state, next_state;

    always @(state,in) begin
        case (state)
            s0: next_state = in ? s1 : s0;
            s1: next_state = in ? s3 : s0;
            s2: next_state = in ? s2 : s0;
            s3: next_state = in ? s2 : s0;
            default: next_state = s0;
        endcase
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= s0;
            out <= 0;
        end else begin
            state <= next_state;
            case (next_state)
                s0: out <= (state == s1 || state == s2 || state == s3);
                default: out <= 0;
            endcase
        end
        out_state <= next_state;
    end

endmodule